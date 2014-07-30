class CreatePhysicalDisks < ActiveRecord::Migration
  def change
    create_table :physical_disks do |t|
      t.string :name
      t.integer :storage_array_id
      t.integer :storage_dae_id
      t.string :disk_type
      t.string :vendor
      t.string :speed
      t.string :product_id
      t.string :revision
      t.string :serial_no
      t.integer :capacity_mb
      t.integer :user_capacity_mb
      t.string :ops_status

      t.timestamps
    end
  end
end
