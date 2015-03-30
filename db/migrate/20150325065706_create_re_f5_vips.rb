class CreateReF5Vips < ActiveRecord::Migration
  def change
    create_table :re_f5_vips do |t|
      t.string :name
      t.string :address
      t.string :ip
      t.string :partition
      t.string :location
      t.string :environment
      t.string :poool_name
      t.string :vip_status
      t.string :irules
      t.string :persistance_method

      t.timestamps
    end
  end
end
