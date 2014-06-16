class CreateDnsRecords < ActiveRecord::Migration
  def change
    create_table :dns_records do |t|
      t.string :ip
      t.string :fqdn
      t.string :record_type
      t.integer :vm_id
      t.integer :f5_vip_id
      t.integer :f5_node_id

      t.timestamps
    end
  end
end
