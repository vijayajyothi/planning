class Vmhost < ActiveRecord::Base
  attr_accessible :bios_version, :cluster_id, :connection_state, :cpu_model, :cpu_total_mhz, :esx_api_version, :esx_build, :esx_product, :esx_version, :host_id, :hw_device_id, :ip, :is_standalone, :mem_total_mb, :model, :name, :num_core, :num_cpu, :parent_id, :power_state, :serial_no, :uuid, :vcenter_id, :vendor
end
