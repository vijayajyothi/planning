class AddF5VipIdToF5Node < ActiveRecord::Migration
  def change
    add_column :f5_nodes, :f5_vip_id, :integer
  end
end
