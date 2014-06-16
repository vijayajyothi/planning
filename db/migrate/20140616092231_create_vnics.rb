class CreateVnics < ActiveRecord::Migration
  def change
    create_table :vnics do |t|
      t.string :name
      t.string :type
      t.integer :vm_id
      t.integer :vcenter_id
      t.string :connect_state
      t.string :macaddress
      t.integer :portgroup_id

      t.timestamps
    end
  end
end
