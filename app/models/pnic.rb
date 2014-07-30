class Pnic < ActiveRecord::Base
  attr_accessible :macaddress, :name, :network_port_id, :network_switch_id, :observed, :speed, :vlan, :vmhost_id, :vswitch_id
 belongs_to :vmhost
  belongs_to :vswitch
  belongs_to :network_switch
  belongs_to :network_port
  searchable do
    integer :id
    integer :vmhost_id
    integer :network_switch_id
  end
end
