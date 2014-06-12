class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :name
      t.integer :vcenter_id
      t.integer :vdc_id
      t.integer :cpu_total_mhz
      t.integer :mem_total_mb
      t.integer :cpu_no_cores

      t.timestamps
    end
  end
end
