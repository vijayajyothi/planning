class AddMemoryDetailsToVm < ActiveRecord::Migration
  def change
    add_column :vms, :guest_state, :string
    add_column :vms, :provisioned_space, :string
    add_column :vms, :used_space, :string
  end
end
