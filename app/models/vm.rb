class Vm < ActiveRecord::Base
  attr_accessible :application_id, :backup, :cluster_id, :connection_state, :created_by, :created_time, :folder_id, :hw_version, :hz_numer, :instance_id, :ip, :is_cloud, :last_boot, :last_change, :last_suspend, :last_suspend_interval, :name, :num_cpus, :num_vnics, :os, :owner, :persistent_id, :power_state, :ppm_no, :resource_pool, :status, :tier_id, :tools_status, :tools_version, :total_mem_mb, :uuid, :vcenter_id, :vdc_id, :version, :vm_hostname, :vm_id, :vmhost_id
  # attr_accessible :application, :boottime, :cluster, :connectionstate, :createdby, :createdtime, :datacenter, :folder, :guestfullname, :gueststate, :hostname, :ipaddress, :memorymb, :numcpu, :persistentid, :powerstate, :provisionedspacegb, :qtynics, :reourcepool, :storagecommitted, :storageuncommitted, :suspendinterval, :suspendtime, :toolsrunningstatus, :toolstatus, :toolsversion, :usedspacegb, :vcserver, :version, :vmhost, :vmname
  
#ASSOCIATIONS
belongs_to :vmhost
belongs_to :tier
belongs_to :instance
belongs_to :folder
belongs_to :application
belongs_to :vcenter
belongs_to :vdc
belongs_to :cluster
has_many :vdisks
has_many :vnics
has_many :dns_records
has_many :vim_events
has_many :f5_nodes
has_many :vmvips
has_many :f5_vips , :through => :vmvips

#SEARCHABLES
searchable do
  text :name
  integer :vmhost_id
  integer :application_id
  integer :vcenter_id
  integer :tier_id
  integer :instance_id
  text :status
  integer :vdc_id
end


# CLASS METHODS
class << self
  def importing_data
    vcenter_data = vcenter_data_import
    p "vcenter data uploaded"
    data_center_data = data_center_data_import
    cluster_data = cluster_import
    p "vdc data uploaded" 
    esx_data = esx_data_import
    p "ESX Host data (vmhost)) uploaded"
  end
# vcenter data
def vcenter_data_import
  CSV.foreach("csv_data/powercli/vcenters.csv", :headers => true) do |row|
    vcenter = Vcenter.find_by_name(row["name"])
    p vcenter
    if vcenter.present?
      vcenter.ops_status = "Present"
      vcenter.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      vcenter = Vcenter.new
      vcenter.ops_status = "New"
      vcenter.attributes = row.to_hash.slice(*accessible_attributes)
    end
    vcenter.save
  end
end

  # data center vdc data
  def data_center_data_import
    CSV.foreach("csv_data/powercli/data_center.csv", :headers => true) do |row|

      vdc = Vdc.find_by_name(row["datacenter"])
      vcenter = Vcenter.find_by_name(row["vcserver"])
      if vdc.present?
        vdc.ops_status = "Present"
        vdc.update_attributes(row.to_hash.slice(*accessible_attributes))
      else
        vdc = Vdc.new
        vdc.ops_status = "New"
        vdc.attributes = row.to_hash.slice(*accessible_attributes)
      end
      vdc.name = row["datacenter"]
      vdc.vcenter_id = vcenter.id
      vdc.save
    end
  end 

# Cluster data
def cluster_import
  CSV.foreach("csv_data/powercli/cluster.csv", :headers => true) do |row|

    vcenter = Vcenter.find_by_name(row["vcserver"])
    p vcenter.id
    vdc = Vdc.find_by_vcenter_id(vcenter.id)
    p vdc
    p "tikll vdc"
    cluster = Cluster.find_by_name(row["cluster"])
    if cluster.present?
      cluster.ops_status = "Present"
      cluster.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      cluster = Cluster.new
      cluster.ops_status = "New"
      cluster.attributes = row.to_hash.slice(*accessible_attributes)
    end
    cluster.name = row["cluster"]
    cluster.vdc_id = vdc.id
    cluster.cpu_total_mhz = row["totalcpu"]
    cluster.mem_total_mb = row["totalmemory"]
    cluster.cpu_no_cores = row["numcpucores"]
    cluster.vcenter_id = vcenter.id
    p "here"
    p cluster
    cluster.save!
  end
end 

def esx_data_import
  end

def import(file)
 ::CSV.foreach(file.path, headers: true) do |row|
  vm = find_by_ip(row["ipaddress"])
  if vm.present?
   vm.ops_status="Present"
   vm.update_attributes(row.to_hash.slice(*accessible_attributes))
 else
  vm = new
  vm.ops_status="New"
  vm.attributes = row.to_hash.slice(*accessible_attributes)
end
      # vm = find_by_id(row["id"]) || new
      # vm.attributes = row.to_hash.slice(*accessible_attributes)
      vm.save!
      #  Cluster.create! row.to_hash
    end
  end
end


#INSTANCE METHODS
end
