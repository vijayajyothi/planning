class AddNewBornToVcenter < ActiveRecord::Migration
  def change
    add_column :vcenters, :new_born_on, :date
  end
end
