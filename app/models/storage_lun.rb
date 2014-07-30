class StorageLun < ActiveRecord::Base
  attr_accessible :capacity_mb, :device_type, :lun, :lun_name, :lun_no, :raid_type, :storage_array_id
 belongs_to :storage_array
  has_many :lun_disks
  has_many :physical_disks, :through => :lun_disks
  has_many :host_luns
  has_many :storage_group_luns
  has_many :storage_groups, :through => :storage_group_luns
end
