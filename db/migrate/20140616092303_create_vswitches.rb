class CreateVswitches < ActiveRecord::Migration
  def change
    create_table :vswitches do |t|
      t.string :name
      t.integer :vcenter_id
      t.integer :vdc_id
      t.integer :vmhost_id
      t.string :ops_status

      t.timestamps
    end
  end
end
