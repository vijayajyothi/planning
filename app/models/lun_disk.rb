class LunDisk < ActiveRecord::Base
  attr_accessible :physical_disk_id, :storage_lun_id
 belongs_to :storage_lun
  belongs_to :physical_disk
end
