class Vnic < ActiveRecord::Base
  attr_accessible :connect_state, :macaddress, :name, :portgroup_id, :type, :vcenter_id, :vm_id
end
