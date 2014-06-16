class CreateFieldLabels < ActiveRecord::Migration
  def change
    create_table :field_labels do |t|
      t.string :o_type
      t.string :field_name
      t.string :label
      t.boolean :display
      t.string :display_page
      t.boolean :sub_panel
      t.string :external_resource
      t.string :external_variable
      t.boolean :external_resource_display
      t.string :style_name
      t.boolean :table_display
      t.boolean :child_table_display
      t.boolean :main_field

      t.timestamps
    end
  end
end
