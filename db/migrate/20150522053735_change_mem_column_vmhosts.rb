class ChangeMemColumnVmhosts < ActiveRecord::Migration
  def up
 change_column :vmhosts, :mem_total_mb, :string
  end


  def down
 change_column :vmhosts, :mem_total_mb, :int
  end
end
