class CreateNetworkSwitches < ActiveRecord::Migration
  def change
    create_table :network_switches do |t|
      t.string :name
      t.string :unique_id
      t.string :contact
      t.string :description
      t.string :location
      t.string :ip
      t.string :vendor
      t.string :model
      t.string :version
      t.string :device_type
      t.string :serial_no

      t.timestamps
    end
  end
end
