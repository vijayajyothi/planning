class NewVm < ActiveRecord::Base
  attr_accessible :application_id, :backup, :cluster_id, :connection_state, :created_by, :created_time, :folder_id, :hw_version, :hz_numer, :instance_id, :ip, :is_cloud, :last_boot, :last_change, :last_suspend, :last_suspend_interval, :name, :num_cpus, :num_vnics, :os, :owner, :persistent_id, :power_state, :ppm_no, :resource_pool, :status, :tier_id, :tools_status, :tools_version, :total_mem_mb, :uuid, :vcenter_id, :vdc_id, :version, :vm_hostname, :vm_id, :vmhost_id
end
