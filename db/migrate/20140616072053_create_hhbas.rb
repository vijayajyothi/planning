class CreateHhbas < ActiveRecord::Migration
  def change
    create_table :hhbas do |t|
      t.string :name
      t.integer :vmhost_id
      t.string :status
      t.string :model
      t.string :driver
      t.string :pci
      t.string :wwnn
      t.string :wwpn
      t.string :ops_status

      t.timestamps
    end
  end
end
