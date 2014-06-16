class CreateVimEvents < ActiveRecord::Migration
  def change
    create_table :vim_events do |t|
      t.datetime :time_stamp
      t.string :username
      t.string :event_message
      t.string :event_type
      t.string :event_tag
      t.integer :vcenter_id
      t.integer :vmhost_id
      t.integer :vm_id
      t.integer :vdc_id

      t.timestamps
    end
  end
end
