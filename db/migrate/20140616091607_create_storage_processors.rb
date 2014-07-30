class CreateStorageProcessors < ActiveRecord::Migration
  def change
    create_table :storage_processors do |t|
      t.string :name
      t.integer :storage_array_id
      t.string :assembly_name
      t.string :vendor_part_no
      t.string :assy_revision
      t.string :art_revision
      t.string :serial_no
      t.string :cabinet
      t.integer :mem_size_kb
      t.integer :manufacture_year
      t.string :manufacture_date
      t.string :ops_status

      t.timestamps
    end
  end
end
