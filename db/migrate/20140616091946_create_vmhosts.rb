class CreateVmhosts < ActiveRecord::Migration
  def change
    create_table :vmhosts do |t|
      t.string :name
      t.string :ip
      t.integer :cluster_id
      t.integer :parent_id
      t.string :connection_state
      t.string :power_state
      t.integer :cpu_total_mhz
      t.integer :mem_total_mb
      t.string :esx_product
      t.string :esx_version
      t.string :esx_build
      t.string :esx_api_version
      t.string :host_id
      t.string :is_standalone
      t.integer :hw_device_id
      t.integer :vcenter_id
      t.string :uuid
      t.string :vendor
      t.string :model
      t.string :cpu_model
      t.integer :num_cpu
      t.integer :num_core
      t.string :serial_no
      t.string :bios_version
      t.string :ops_status

      t.timestamps
    end
  end
end
