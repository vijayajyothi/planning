class NetworkSwitch < ActiveRecord::Base
  attr_accessible :contact, :description, :device_type, :ip, :location, :model, :name, :serial_no, :unique_id, :vendor, :version
has_many :network_ports
  has_many :pnics
  has_many :vmhosts , :through => :pnics

  searchable do
    text :name
    text :ip
    text :unique_id
    text :vendor
    text :serial_no
    text :version
    text :vmhosts do
      vmhosts.map {|vmhost| vmhost.name}
    end
  end
end
