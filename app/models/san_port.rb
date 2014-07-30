class SanPort < ActiveRecord::Base
  attr_accessible :index, :port, :port_type, :protocol, :san_switch_id, :slot, :speed, :status
end
