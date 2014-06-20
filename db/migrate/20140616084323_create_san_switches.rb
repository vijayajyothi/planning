class CreateSanSwitches < ActiveRecord::Migration
  def change
    create_table :san_switches do |t|
      t.string :name
      t.string :ip
      t.string :vendor
      t.string :model
      t.string :boot_prom
      t.string :fabric_os
      t.string :factory_part_no
      t.string :kernel
      t.string :part_no
      t.string :serial_no
      t.string :domain
      t.string :switch_id
      t.string :state
      t.string :switch_type
      t.string :wwn
      t.string :ops_status

      t.timestamps
    end
  end
end
