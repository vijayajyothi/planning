class AddOpsStatusToReF5Inventories < ActiveRecord::Migration
  def change
    add_column :re_f5_inventories, :ops_status, :string
  end
end
