class PhysicalDisk < ActiveRecord::Base
  attr_accessible :capacity_mb, :disk_type, :name, :product_id, :revision, :serial_no, :speed, :storage_array_id, :storage_dae_id, :user_capacity_mb, :vendor
 belongs_to :storage_array
  belongs_to :storage_dae
  has_many :lun_disks
  has_many :storage_luns, :through => :lun_disks
  searchable do
    integer :id
    integer :storage_array_id
  end
end
