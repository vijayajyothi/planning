class AddDeletionToVms < ActiveRecord::Migration
  def change
    add_column :vms, :requested_by, :string
    add_column :vms, :requested_date, :date
  end
end
