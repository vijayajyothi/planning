class CreateReF5Inventories < ActiveRecord::Migration
  def change
    create_table :re_f5_inventories do |t|
      t.string :serial
      t.string :hostname
      t.string :admin_ip
      t.string :marketing_name
      t.string :version
      t.string :failover_mode
      t.string :failover_state
      t.string :peer_address
      t.string :peer_admin_ip
      t.string :floating_ip
      t.string :location
      t.string :environment
      t.string :re_f5_vip_ip

      t.timestamps
    end
  end
end
