class CreateOvms < ActiveRecord::Migration
  def change
    create_table :ovms do |t|
      t.string :vm_name
      t.string :status
      t.string :date_created
      t.string :os
      t.string :mem_gb
      t.string :disk_gb
      t.string :ip
      t.string :vapp_name
      t.string :vapp_status
      t.string :application
      t.string :app_owner
      t.string :own_email
      t.integer :ovdc_id
      t.string :org
      t.string :vm_desc
      t.string :vapp_desc

      t.timestamps
    end
  end
end
