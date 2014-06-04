class Vm < ActiveRecord::Base
  attr_accessible :application, :boottime, :cluster, :connectionstate, :createdby, :createdtime, :datacenter, :folder, :guestfullname, :gueststate, :hostname, :ipaddress, :memorymb, :numcpu, :persistentid, :powerstate, :provisionedspacegb, :qtynics, :reourcepool, :storagecommitted, :storageuncommitted, :suspendinterval, :suspendtime, :toolsrunningstatus, :toolstatus, :toolsversion, :usedspacegb, :vcserver, :version, :vmhost, :vmname
 searchable do
  text :vmname, :vcserver
end
  def self.import(file)
  ::CSV.foreach(file.path, headers: true) do |row|
    vm = find_by_id(row["id"]) || new
    vm.attributes = row.to_hash.slice(*accessible_attributes)
    vm.save!
#  Cluster.create! row.to_hash
  end
 end
end
