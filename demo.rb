#! /usr/bin/ruby
http://rubygems.org

require 'active_support/all'
require 'savon'

class EloquaImport

  def initialize import_id, report
    @import_id = import_id
    @report = report
    @num_attempts = 0
    @req_id = nil
  end

  def run
    submit_import
    check_import_status
  end

  def binary_report
    Base64.encode64(@report.to_s)
  end

  def num_attempts
    @num_attempts
  end

  def status
    @status
  end

  def submit_import
    res = Eloqua::DataTransferApi.data_import(import_type, binary_report)
    @req_id = res['ID']

    puts "Initialized Import. Got the following ID: #{@req_id}"
  end

  def check_import_status
    while status != 'Complete'
      if status == 'Failure' or num_attempts > max_attempts
        raise EloquaImportGenerationError.new
      elsif status == 'Inactive'
        raise EloquaImportInactiveError.new
      end

      sleep grace_period
      @num_attempts += 1
      get_import_status
    end
  end

  def get_import_status
    @status = Eloqua::DataTransferApi.data_import_status(import_type, {id: @req_id})

    puts "Polling for status. Status is: #{@status}"
  end

  def import_type
    {
        id: @import_id,
        name: '',
        type: 'DataImport'
    }
  end

  class EloquaImportGenerationError < StandardError
    def initialize
      super('Eloqua Import Failed.')
    end
  end

  class EloquaImportInactiveError < StandardError
    def initialize
      super('Eloqua Import Is Inactive.')
    end
  end

  private
  def grace_period
    5
  end

  def max_attempts
    360
  end

end

module Eloqua
  class << self
    def api_username= username
      @api_username = username
    end

    def api_username
      @api_username
    end

    def password= password
      @password = password
    end

    def password
      @password
    end
  end

  class SoapClient
    class << self

      def operations
        client.operations
      end

      def call(operation, options = {})
        client.call(operation, options)
      end

      def request(operation, message, options = {})
        options.merge!({message: message})
        response = call(operation, options)

        begin
          response = response.body
        rescue
          begin
            response = response.to_xml.scan(/(<.+>)/).flatten.last
            response = Nori.new.parse(response)
            response = response["s:Envelope"]["s:Body"]
          rescue
            response
          end
        end

        parse_response(operation, response)
      rescue Eloqua::SoapClient::EloquaRateLimitError => e
        puts "#{self}##{operation} tripped the Eloqua API rate limit. Sleeping for five seconds zZzZz. Error: #{e.to_s}\n"
        sleep 5
        retry
      end

      def parse_response(operation, response)
        # Extract the response/result keys if such exist
        if response.respond_to? :has_key?
          ["#{operation}_response".to_sym, "#{operation}_result".to_sym].each do |key|
            response = response[key] if response.has_key?(key)
          end
        end

        process_errors(response)
      end

      def process_errors(response)
        # Check for Eloqua faults and errors
        if response.respond_to? :has_key?
          if response.has_key? :fault
            case response[:fault][:faultcode]
              when 's:OPERATION_TIME_INTERVAL_LIMIT_REACHED'
                raise EloquaRateLimitError.new(response[:fault][:faultstring])
              else
                raise EloquaFaultError.new(response[:fault][:faultcode], response[:fault][:faultstring])
            end
          end
        end

        response
      end

      private
      def grace_period
        5
      end

      def max_attempts
        3
      end

      def client(&block)
        wsdl_file = const_get(:WSDL)

        Savon.client do
          wsdl(wsdl_file)
          wsse_auth(Eloqua.api_username, Eloqua.password)
          convert_request_keys_to :none
          raise_errors false
          log_level :debug
          log true
          pretty_print_xml true

          yield self if block_given?
        end
      end
    end

    # Custom Exceptions

    class EloquaFaultError < StandardError

      def initialize(fault_code, fault_string)
        super("Eloqua API Fault! Fault code: #{fault_code}. Fault description: #{fault_string}.")
      end

    end

    class EloquaRateLimitError < StandardError

      def initialize(fault_string)
        super("Eloqua API Rate Limit Hit! #{fault_string}.")
      end

    end

  end

  class DataTransferApi < Eloqua::SoapClient

    WSDL = File.join(File.dirname(__FILE__), 'wsdl', 'DataTransferService.svc.wsdl')

    class << self

      def data_import_status(data_import, import_id)
        operation = :data_import_status
        message = {
            eloqua_type: add_namespace_to_keys(data_import),
            data_import_execution: add_namespace_to_keys(import_id)
        }
        request(operation, message)
      end

      def data_import(data_import, byte_stream, source_file_type = 'DelimitedFile')
        operation = :initialize_data_import
        message = {
            byte_stream: byte_stream,
            eloqua_type: add_namespace_to_keys(data_import),
            source_file_type: source_file_type
        }

        request(operation, message)
      end

      def request(operation, message)
        message = add_namespace_to_keys(message, :lower)
        response = super(operation, message)

        # Extract the response/result keys if such exist
        # Since this API returns a malformed response, Savon doesn't symbolize the keys
        if response.respond_to? :has_key?
          ["#{operation}_response".camelize, "#{operation}_result".camelize].each do |key|
            key.gsub!(/Url/, 'URL')
            response = response[key] if response.has_key?(key)
          end
        end

        process_errors(response)
      end

      def process_errors(response)
        # Check for Eloqua faults and errors
        if response.respond_to? :has_key?
          if response.has_key? 's:Fault'
            #  raise  Eloqua::SoapClient::EloquaFaultError.new(response['s:Fault']['faultcode'], response['s:Fault']['faultstring'])

            case response['s:Fault']['faultcode']
              when 's:OPERATION_TIME_INTERVAL_LIMIT_REACHED'
                raise Eloqua::SoapClient::EloquaRateLimitError.new(response['s:Fault']['faultstring'])
              else
                raise Eloqua::SoapClient::EloquaFaultError.new(response['s:Fault']['faultcode'], response['s:Fault']['faultstring'])
            end
          end
        end

        response
      end

      def client
        super do |c|
          c.namespaces(
              'xmlns:wsdl' => 'https://secure.eloqua.com/API/1.2',
              'xmlns:ins0' => 'http://schemas.microsoft.com/2003/10/Serialization/Arrays'
          )
        end
      end

      def add_namespace_to_keys(hash, camel_type = :upper, namespace = 'wsdl')
        temp_hash = {}
        hash.each do |k, v|
          temp_hash[namespace + ':' + (k == :id ? k.to_s.upcase : k.to_s.camelize(camel_type))] = v
        end
        temp_hash
      end
    end
  end
end


class Demo

  def self.run
    puts "Running..."

    # Auth
    Eloqua.api_username = 'VMWareSandboxSFDC\\Ilya.Hoffman'
    Eloqua.password = 'PASSWORD'

    # Input File
    file = File.read('vmware_demo.csv')

    # Eloqua import
    EloquaImport.new(51, file).run
  end

end


Demo.run
