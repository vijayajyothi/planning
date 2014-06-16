class NetworkSwitch < ActiveRecord::Base
  attr_accessible :contact, :description, :device_type, :ip, :location, :model, :name, :serial_no, :unique_id, :vendor, :version
end
