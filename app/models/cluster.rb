class Cluster < ActiveRecord::Base
  attr_accessible :cpu_no_cores, :cpu_total_mhz, :drs_enables, :folder_id, :ha_enabled, :mem_total_mb, :name, :vcenter_id, :vdc_id
belongs_to :vcenter
  belongs_to :vdc
  belongs_to :folder
  has_many :vmhosts
  has_many :vms
   searchable do
    text :name
    integer :vcenter_id
    integer :vdc_id
    text :vmhosts do
      vmhosts.map {|vmhost| vmhost.name}
    end
    text :vms do
      vms.map {|vm| vm.name}
    end
  end
end
