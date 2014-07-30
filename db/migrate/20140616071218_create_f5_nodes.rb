class CreateF5Nodes < ActiveRecord::Migration
  def change
    create_table :f5_nodes do |t|
      t.string :ip
      t.integer :port
      t.integer :f5_pool_id
      t.integer :f5_cluster_id
      t.integer :vm_id
      t.string :ops_status

      t.timestamps
    end
  end
end
