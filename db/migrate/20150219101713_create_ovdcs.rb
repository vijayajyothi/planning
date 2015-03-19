class CreateOvdcs < ActiveRecord::Migration
  def change
    create_table :ovdcs do |t|
      t.string :org
      t.string :ovdc
      t.string :storage_pct
      t.string :mem_pct
      t.string :cpu_pct
      t.string :st_limit
      t.string :st_alloc
      t.string :st_used
      t.string :st_free
      t.string :mem_limit
      t.string :mem_alloc
      t.string :mem_used
      t.string :mem_free
      t.string :cpu_limit
      t.string :cpu_alloc
      t.string :cpu_used

      t.timestamps
    end
  end
end
