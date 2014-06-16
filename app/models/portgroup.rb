class Portgroup < ActiveRecord::Base
  attr_accessible :a_s, :name, :pnic_id, :vcenter_id, :vdc_id, :vmhost_id, :vswitch, :vswitch_id
end
