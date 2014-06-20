class CreateVcenters < ActiveRecord::Migration
  def change
    create_table :vcenters do |t|
      t.string :name
      t.string :ip
      t.string :description
      t.string :ops_status

      t.timestamps
    end
  end
end
