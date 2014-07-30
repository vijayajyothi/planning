class Datastore < ActiveRecord::Base
  attr_accessible :accessible, :capacity, :ds_id, :freespace, :name, :url, :vcenter_id, :vdc_id
 belongs_to :vdc
  belongs_to :vcenter
  has_many :vdisks
  has_many :vms, :through => :vdisks
   searchable do
    text :name
    integer :vcenter_id
    text :vms do
      vms.map {|vm| vm.name}
    end
  end
end
