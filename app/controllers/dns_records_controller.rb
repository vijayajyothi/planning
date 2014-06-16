class DnsRecordsController < ApplicationController
  # GET /dns_records
  # GET /dns_records.json
  def index
    @dns_records = DnsRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dns_records }
    end
  end

  # GET /dns_records/1
  # GET /dns_records/1.json
  def show
    @dns_record = DnsRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dns_record }
    end
  end

  # GET /dns_records/new
  # GET /dns_records/new.json
  def new
    @dns_record = DnsRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dns_record }
    end
  end

  # GET /dns_records/1/edit
  def edit
    @dns_record = DnsRecord.find(params[:id])
  end

  # POST /dns_records
  # POST /dns_records.json
  def create
    @dns_record = DnsRecord.new(params[:dns_record])

    respond_to do |format|
      if @dns_record.save
        format.html { redirect_to @dns_record, notice: 'Dns record was successfully created.' }
        format.json { render json: @dns_record, status: :created, location: @dns_record }
      else
        format.html { render action: "new" }
        format.json { render json: @dns_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dns_records/1
  # PUT /dns_records/1.json
  def update
    @dns_record = DnsRecord.find(params[:id])

    respond_to do |format|
      if @dns_record.update_attributes(params[:dns_record])
        format.html { redirect_to @dns_record, notice: 'Dns record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dns_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dns_records/1
  # DELETE /dns_records/1.json
  def destroy
    @dns_record = DnsRecord.find(params[:id])
    @dns_record.destroy

    respond_to do |format|
      format.html { redirect_to dns_records_url }
      format.json { head :no_content }
    end
  end
end
