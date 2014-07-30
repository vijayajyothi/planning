class HostLun < ActiveRecord::Base
  attr_accessible :hhba_id, :lun_no, :storage_array_id, :storage_group_id, :storage_lun_id, :vmhost_id
 belongs_to :vmhost
  belongs_to :hhba
  belongs_to :storage_lun
  belongs_to :storage_array
  belongs_to :storage_group
end
