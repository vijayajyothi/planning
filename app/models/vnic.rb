class Vnic < ActiveRecord::Base
  attr_accessible :connect_state, :macaddress, :name, :portgroup_id, :type, :vcenter_id, :vm_id
  belongs_to :vm
  belongs_to :vcenter
  belongs_to :portgroup
  searchable do
    integer :id
    integer :vm_id
    integer :vcenter_id
   end
end
