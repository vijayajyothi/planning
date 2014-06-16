class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :description
      t.string :notes
      t.string :business_owner

      t.timestamps
    end
  end
end
