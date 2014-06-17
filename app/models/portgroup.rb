class Portgroup < ActiveRecord::Base
  attr_accessible :a_s, :name, :pnic_id, :vcenter_id, :vdc_id, :vmhost_id, :vswitch, :vswitch_id
belongs_to :vmhost
  belongs_to :vswitch
  belongs_to :vcenter
  belongs_to :vdc
 # belongs_to :pnic
  has_many :vnics
end
