class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      t.string :datacenter
      t.string :qtynics
      t.string :createdby
      t.datetime :createdtime
      t.string :suspendinterval
      t.datetime :suspendtime
      t.string :boottime
      t.string :storageuncommitted
      t.string :storagecommitted
      t.string :ipaddress
      t.string :hostname
      t.string :toolsrunningstatus
      t.string :toolsversion
      t.string :toolstatus
      t.string :guestfullname
      t.string :usedspacegb
      t.string :provisionedspacegb
      t.string :memorymb
      t.string :numcpu
      t.string :version
      t.string :gueststate
      t.string :connectionstate
      t.string :powerstate
      t.string :application
      t.string :persistentid
      t.string :vmname
      t.string :vmhost
      t.string :folder
      t.string :reourcepool
      t.string :cluster
      t.string :vcserver

      t.timestamps
    end
  end
end
