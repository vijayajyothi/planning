class CreateStorageLuns < ActiveRecord::Migration
  def change
    create_table :storage_luns do |t|
      t.string :lun
      t.integer :storage_array_id
      t.string :lun_name
      t.string :device_type
      t.integer :capacity_mb
      t.string :raid_type
      t.integer :lun_no

      t.timestamps
    end
  end
end
