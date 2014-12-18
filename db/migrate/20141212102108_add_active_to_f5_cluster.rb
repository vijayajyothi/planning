class AddActiveToF5Cluster < ActiveRecord::Migration
  def change
    add_column :f5_clusters, :active, :string
  end
end
