class CreateReF5Pools < ActiveRecord::Migration
  def change
    create_table :re_f5_pools do |t|
      t.string :name
      t.integer :re_f5_vip_id
      t.string :pool_members
      t.string :lb_method
      t.string :pool_monitor
      t.string :pool_status

      t.timestamps
    end
  end
end
