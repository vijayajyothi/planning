class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :name
      t.string :description
      t.integer :application_id
      t.integer :instance_id

      t.timestamps
    end
  end
end
