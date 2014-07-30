class CreateHostLuns < ActiveRecord::Migration
  def change
    create_table :host_luns do |t|
      t.integer :lun_no
      t.integer :vmhost_id
      t.integer :storage_lun_id
      t.integer :storage_array_id
      t.integer :storage_group_id
      t.integer :hhba_id
      t.string :ops_status

      t.timestamps
    end
  end
end
