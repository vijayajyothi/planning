class StorageGroupLun < ActiveRecord::Base
  attr_accessible :host_lun, :storage_group_id, :storage_lun_id
end
