class StorageGroupLun < ActiveRecord::Base
  attr_accessible :host_lun, :storage_group_id, :storage_lun_id
 belongs_to :storage_group
  belongs_to :storage_lun
  has_many :host_luns
end
