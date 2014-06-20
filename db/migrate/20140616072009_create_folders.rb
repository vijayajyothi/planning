class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.integer :parent_id
      t.string :description
      t.string :ops_status

      t.timestamps
    end
  end
end
