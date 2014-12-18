class AddStatusToF5Vip < ActiveRecord::Migration
  def change
    add_column :f5_vips, :vip_enable, :string
    add_column :f5_vips, :vip_status, :string
  end
end
