class LunDisk < ActiveRecord::Base
  attr_accessible :physical_disk_id, :storage_lun_id
end
