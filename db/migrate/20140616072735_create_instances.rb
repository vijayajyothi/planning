class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :name
      t.string :description
      t.integer :application_id
      t.integer :inst_id

      t.timestamps
    end
  end
end
