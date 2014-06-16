class CreateStorageArrays < ActiveRecord::Migration
  def change
    create_table :storage_arrays do |t|
      t.string :name
      t.tring :ip
      t.string :uid
      t.string :model
      t.string :model_type
      t.string :agent_revision
      t.string :prom_revision
      t.string :revision
      t.string :serial_no
      t.string :cabinet

      t.timestamps
    end
  end
end
