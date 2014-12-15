class AddOpsStatusToF5Device < ActiveRecord::Migration
  def change
    add_column :f5_devices, :ops_status, :string
  end
end
