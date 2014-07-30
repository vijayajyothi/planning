class CreateVdcs < ActiveRecord::Migration
  def change
    create_table :vdcs do |t|
      t.string :name
      t.integer :folder_id
      t.string :description
      t.integer :vcenter_id
      t.string :ops_status

      t.timestamps
    end
  end
end
