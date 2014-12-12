class CreateF5Devices < ActiveRecord::Migration
  def change
    create_table :f5_devices do |t|
      t.string :device
      t.string :ip
      t.string :status

      t.timestamps
    end
  end
end
