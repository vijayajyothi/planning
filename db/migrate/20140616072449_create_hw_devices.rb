class CreateHwDevices < ActiveRecord::Migration
  def change
    create_table :hw_devices do |t|
      t.string :name
      t.string :type
      t.string :manufacturer
      t.string :model
      t.string :serial_no
      t.string :asset_no
      t.string :status
      t.string :country
      t.string :state
      t.string :building
      t.string :room
      t.string :floor
      t.integer :ru_size
      t.integer :ru_position
      t.string :hostname
      t.string :ip
      t.string :owned_by
      t.string :assigned_by
      t.string :cost_center
      t.string :console
      t.string :console_ip
      t.string :ops_status

      t.timestamps
    end
  end
end
