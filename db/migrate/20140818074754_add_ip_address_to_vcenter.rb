class AddIpAddressToVcenter < ActiveRecord::Migration
  def change
    add_column :vcenters, :ip_address, :string
  end
end
