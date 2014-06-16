class CreateF5Pools < ActiveRecord::Migration
  def change
    create_table :f5_pools do |t|
      t.string :name
      t.integer :f5_vip_id
      t.integer :f5_cluster_id
      t.string :lb_method

      t.timestamps
    end
  end
end
