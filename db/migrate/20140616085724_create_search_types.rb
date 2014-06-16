class CreateSearchTypes < ActiveRecord::Migration
  def change
    create_table :search_types do |t|
      t.string :asset_type
      t.string :asset_label
      t.string :main_field

      t.timestamps
    end
  end
end
