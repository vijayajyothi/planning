class RenameDeviceColumn < ActiveRecord::Migration
  def up
   rename_column :f5_devices, :device, :name
  end

  def down
  end
end
