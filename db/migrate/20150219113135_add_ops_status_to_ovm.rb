class AddOpsStatusToOvm < ActiveRecord::Migration
  def change
    add_column :ovms, :ops_status, :string
  end
end
