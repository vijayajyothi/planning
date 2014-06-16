class CreateNetworkPorts < ActiveRecord::Migration
  def change
    create_table :network_ports do |t|
      t.string :name
      t.integer :network_switch_id
      t.string :object_id
      t.string :type
      t.string :alias
      t.integer :speed_in
      t.integer :speed_out
      t.integer :ip
      t.string :if_alias
      t.string :if_name
      t.string :if_index
      t.string :contact
      t.string :full_duplex
      t.string :unique_id
      t.string :if_macaddress

      t.timestamps
    end
  end
end
