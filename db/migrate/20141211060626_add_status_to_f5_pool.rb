class AddStatusToF5Pool < ActiveRecord::Migration
  def change
    add_column :f5_pools, :pool_status, :string
  end
end
