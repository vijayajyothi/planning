class ChangeColumnVmhosts < ActiveRecord::Migration
  def up
    change_column :vmhosts, :cpu_total_mhz, :string
  end

  def down
    change_column :vmhosts, :cpu_total_mhz, :int
  end
end
