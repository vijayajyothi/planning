class HostLun < ActiveRecord::Base
  attr_accessible :hhba_id, :lun_no, :storage_array_id, :storage_group_id, :storage_lun_id, :vmhost_id
end
