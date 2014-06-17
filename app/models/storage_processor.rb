class StorageProcessor < ActiveRecord::Base
  attr_accessible :art_revision, :assembly_name, :assy_revision, :cabinet, :manufacture_date, :manufacture_year, :mem_size_kb, :name, :serial_no, :storage_array_id, :vendor_part_no
  belongs_to :storage_array

end
