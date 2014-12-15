class AddStatusToF5Node < ActiveRecord::Migration
  def change
    add_column :f5_nodes, :node_enable, :string
    add_column :f5_nodes, :node_status, :string
  end
end
