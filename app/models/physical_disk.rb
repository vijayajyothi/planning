class PhysicalDisk < ActiveRecord::Base
  attr_accessible :capacity_mb, :disk_type, :name, :product_id, :revision, :serial_no, :speed, :storage_array_id, :storage_dae_id, :user_capacity_mb, :vendor
end
