class CreateAppresources < ActiveRecord::Migration
  def change
    create_table :appresources do |t|
      t.integer :application_id
      t.integer :service_id

      t.timestamps
    end
  end
end
