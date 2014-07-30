class CreateSanPorts < ActiveRecord::Migration
  def change
    create_table :san_ports do |t|
      t.integer :san_switch_id
      t.integer :index
      t.integer :slot
      t.integer :port
      t.string :speed
      t.string :status
      t.string :protocol
      t.string :port_type
      t.string :ops_status

      t.timestamps
    end
  end
end
