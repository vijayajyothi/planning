class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      # t.string :datacenter
      # t.string :qtynics
      # t.string :createdby
      # t.datetime :createdtime
      # t.string :suspendinterval
      # t.datetime :suspendtime
      # t.string :boottime
      # t.string :storageuncommitted
      # t.string :storagecommitted
      # t.string :ipaddress
      # t.string :hostname
      # t.string :toolsrunningstatus
      # t.string :toolsversion
      # t.string :toolstatus
      # t.string :guestfullname
      # t.string :usedspacegb
      # t.string :provisionedspacegb
      # t.string :memorymb
      # t.string :numcpu
      # t.string :version
      # t.string :gueststate
      # t.string :connectionstate
      # t.string :powerstate
      # t.string :application
      # t.string :persistentid
      # t.string :vmname
      # t.string :vmhost
      # t.string :folder
      # t.string :reourcepool
      # t.string :cluster
      # t.string :vcserver

           t.string :name
      t.string :resource_pool
      t.string :status
      t.datetime :last_boot
      t.string :vm_hostname
      t.string :ip
      t.integer :vmhost_id
      t.integer :tier_id
      t.string :backup
      t.string :hw_version
      t.integer :total_mem_mb
      t.integer :num_cpus
      t.integer :num_vnics
      t.string :power_state
      t.string :connection_state
      t.string :os
      t.string :uuid
      t.string :tools_version
      t.string :tools_status
      t.datetime :created_time
      t.string :created_by
      t.integer :folder_id
      t.string :hz_numer
      t.integer :application_id
      t.integer :vcenter_id
      t.integer :vdc_id
      t.integer :cluster_id
      t.integer :instance_id
      t.string :persistent_id
      t.string :vm_id
      t.string :version
      t.datetime :last_suspend
      t.integer :last_suspend_interval
      t.datetime :last_change
      t.string :owner
      t.string :ppm_no
      t.boolean :is_cloud

      t.timestamps
    end
  end
end
