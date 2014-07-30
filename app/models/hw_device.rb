class HwDevice < ActiveRecord::Base
  attr_accessible :asset_no, :assigned_by, :building, :console, :console_ip, :cost_center, :country, :floor, :hostname, :ip, :manufacturer, :model, :name, :owned_by, :room, :ru_position, :ru_size, :serial_no, :state, :status, :type
  has_one :vmhost

end
