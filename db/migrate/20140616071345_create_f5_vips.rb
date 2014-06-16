class CreateF5Vips < ActiveRecord::Migration
  def change
    create_table :f5_vips do |t|
      t.string :name
      t.string :ip
      t.integer :port
      t.integer :application_id
      t.integer :instance_id
      t.integer :tier_id
      t.integer :f5_cluster_id

      t.timestamps
    end
  end
end
