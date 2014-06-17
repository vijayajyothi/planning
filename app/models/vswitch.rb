class Vswitch < ActiveRecord::Base
  attr_accessible :name, :vcenter_id, :vdc_id, :vmhost_id
belongs_to :vcenter
  belongs_to :vdc
  belongs_to :vmhost
  has_many :pnics
  has_many :portgroups
  has_many :vnics, :through => :portgroups
   searchable do
    integer :id
    integer :vcenter_id
    integer :vmhost_id
   end
end
