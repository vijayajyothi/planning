class CreateDatastores < ActiveRecord::Migration
  def change
    create_table :datastores do |t|
      t.string :name
      t.string :ds_id
      t.string :accessible
      t.string :url
      t.integer :capacity
      t.integer :freespace
      t.integer :vcenter_id
      t.integer :vdc_id

      t.timestamps
    end
  end
end
