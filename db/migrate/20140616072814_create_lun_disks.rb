class CreateLunDisks < ActiveRecord::Migration
  def change
    create_table :lun_disks do |t|
      t.string :storage_lun_id
      t.string :physical_disk_id

      t.timestamps
    end
  end
end
