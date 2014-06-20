class CreateStorageGroups < ActiveRecord::Migration
  def change
    create_table :storage_groups do |t|
      t.string :name
      t.integer :storage_array_id
      t.integer :hhba_id
      t.integer :vmhost_id
      t.string :ops_status

      t.timestamps
    end
  end
end
