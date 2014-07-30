class AddLocationToVcenters < ActiveRecord::Migration
  def change
    add_column :vcenters, :location, :string
  end
end
