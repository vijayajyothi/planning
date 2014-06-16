class Pnic < ActiveRecord::Base
  attr_accessible :macaddress, :name, :network_port_id, :network_switch_id, :observed, :speed, :vlan, :vmhost_id, :vswitch_id
end
