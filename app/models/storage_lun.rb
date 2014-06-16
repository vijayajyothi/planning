class StorageLun < ActiveRecord::Base
  attr_accessible :capacity_mb, :device_type, :lun, :lun_name, :lun_no, :raid_type, :storage_array_id
end
