class AddOpsStatusToVm < ActiveRecord::Migration
  def change
    add_column :vms, :ops_status, :string
  end
end
