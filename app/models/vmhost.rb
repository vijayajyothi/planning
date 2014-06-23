class Vmhost < ActiveRecord::Base
  attr_accessible :bios_version, :cluster_id, :connection_state, :cpu_model, :cpu_total_mhz, :esx_api_version, :esx_build, :esx_product, :esx_version, :host_id, :hw_device_id, :ip, :is_standalone, :mem_total_mb, :model, :name, :num_core, :num_cpu, :parent_id, :power_state, :serial_no, :uuid, :vcenter_id, :vendor
 belongs_to :cluster
  # belongs_to :hw_device
  belongs_to :vcenter
  # has_many :storage_groups
  has_many :vms
  # has_many :pnics
  # has_many :datastores
  # has_many :hhbas
  # has_many :storage_arrays, :through => :storage_groups
  # has_many :portgroups
  # has_many :vswitches
  # has_many :host_luns
  # has_many :vim_events
  # has_many :storage_luns, :through => :storage_groups

   searchable do
    text :name
    integer :vcenter_id
    text :vms do
      vms.map {|vm| vm.name}
    end
   end
end
