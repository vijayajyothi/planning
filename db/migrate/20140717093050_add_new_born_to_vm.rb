class AddNewBornToVm < ActiveRecord::Migration
  def change
    add_column :vms, :new_born_on, :date
  end
end
