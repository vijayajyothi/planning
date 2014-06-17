class CreateVcenters < ActiveRecord::Migration
  def change
    create_table :vcenters do |t|
      t.string :name
      t.string :ip
      t.string :description

      t.timestamps
    end
  end
end
