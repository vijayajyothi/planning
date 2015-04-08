class AddOpsStatusToReF5Vip < ActiveRecord::Migration
  def change
    add_column :re_f5_vips, :ops_status, :string
  end
end
