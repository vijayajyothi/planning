class CreateVmvips < ActiveRecord::Migration
  def change
    create_table :vmvips do |t|
      t.integer :vm_id
      t.integer :f5_vip_id

      t.timestamps
    end
  end
end
