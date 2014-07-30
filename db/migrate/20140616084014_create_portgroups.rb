class CreatePortgroups < ActiveRecord::Migration
  def change
    create_table :portgroups do |t|
      t.string :name
      t.integer :vmhost_id
      t.string :vswitch
      t.integer :pnic_id
      t.string :a_s
      t.integer :vswitch_id
      t.integer :vcenter_id
      t.integer :vdc_id
      t.string :ops_status

      t.timestamps
    end
  end
end
