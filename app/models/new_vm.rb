class NewVm < ActiveRecord::Base
  attr_accessible :application_id, :backup, :cluster_id, :connection_state, :created_by, :created_time, :folder_id, :hw_version, :hz_numer, :instance_id, :ip, :is_cloud, :last_boot, :last_change, :last_suspend, :last_suspend_interval, :name, :num_cpus, :num_vnics, :os, :owner, :persistent_id, :power_state, :ppm_no, :resource_pool, :status, :tier_id, :tools_status, :tools_version, :total_mem_mb, :uuid, :vcenter_id, :vdc_id, :version, :vm_hostname, :vm_id, :vmhost_id
 belongs_to :vmhost
  belongs_to :tier
  belongs_to :instance
  belongs_to :folder
  belongs_to :application
  belongs_to :vcenter
  belongs_to :vdc
  belongs_to :cluster
  has_many :vdisks
  has_many :vnics
  has_many :dns_records
  has_many :vim_events
  has_many :f5_nodes
  has_many :vmvips
  has_many :f5_vips , :through => :vmvips

  searchable do
    text :name
    integer :vmhost_id
    integer :application_id
    integer :vcenter_id
    integer :tier_id
    integer :instance_id
    text :status
    integer :vdc_id
  end
end
