class AddVipsToReF5Pools < ActiveRecord::Migration
  def change
    add_column :re_f5_pools, :vips, :string
  end
end
