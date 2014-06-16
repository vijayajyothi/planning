class CreateVdisks < ActiveRecord::Migration
  def change
    create_table :vdisks do |t|
      t.string :name
      t.integer :vm_id
      t.integer :vcenter_id
      t.string :type
      t.string :persistence
      t.string :format
      t.integer :datastore_id
      t.string :filename
      t.integer :capacitykb

      t.timestamps
    end
  end
end
