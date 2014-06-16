class CreateStorageGroupLuns < ActiveRecord::Migration
  def change
    create_table :storage_group_luns do |t|
      t.integer :storage_group_id
      t.integer :storage_lun_id
      t.integer :host_lun

      t.timestamps
    end
  end
end
