class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.string :notes
      t.string :category
      t.string :ops_status

      t.timestamps
    end
  end
end
