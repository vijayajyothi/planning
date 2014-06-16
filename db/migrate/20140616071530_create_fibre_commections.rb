class CreateFibreCommections < ActiveRecord::Migration
  def change
    create_table :fibre_commections do |t|
      t.string :type
      t.integer :fabric_id
      t.string :fabric_type
      t.integer :san_port_id

      t.timestamps
    end
  end
end
