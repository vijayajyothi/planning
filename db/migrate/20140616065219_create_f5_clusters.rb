class CreateF5Clusters < ActiveRecord::Migration
  def change
    create_table :f5_clusters do |t|
      t.string :data_center
      t.string :primary_unit_ip
      t.string :secondary_unit_ip
      t.string :primary_unit_name
      t.string :secondary_unit_name
      t.string :network_list
      t.string :network_name_list
      t.string :access_ip
      t.string :name

      t.timestamps
    end
  end
end
