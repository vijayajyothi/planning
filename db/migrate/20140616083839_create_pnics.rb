class CreatePnics < ActiveRecord::Migration
  def change
    create_table :pnics do |t|
      t.string :name
      t.integer :vmhost_id
      t.integer :speed
      t.string :macaddress
      t.string :network_switch_id
      t.string :network_port_id
      t.string :vlan
      t.string :observed
      t.integer :vswitch_id
      t.string :ops_status

      t.timestamps
    end
  end
end
