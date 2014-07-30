class StorageDae < ActiveRecord::Base
  attr_accessible :art_revision, :assembly_name, :assy_revision, :manufacture_date, :name, :serial_no, :storage_array_id, :vendor_part_no
 belongs_to :storage_array
  has_many :physical_disks
end
