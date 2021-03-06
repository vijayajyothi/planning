class Vm < ActiveRecord::Base
 acts_as_xlsx
 attr_accessible :application_id, :backup, :cluster_id, :connection_state, 
 :created_by, :created_time, :folder_id, :hw_version, :hz_numer, :instance_id, 
 :ip, :is_cloud, :last_boot, :last_change, :last_suspend, :last_suspend_interval, 
 :name, :num_cpus, :num_vnics, :os, :owner, :persistent_id, :power_state, 
 :ppm_no, :resource_pool, :status, :tier_id, :tools_status, :tools_version, 
 :total_mem_mb, :uuid, :vcenter_id, :vdc_id, :version, :vm_hostname, :vm_id, 
 :vmhost_id, :ops_status, :new_bon_on, :guest_state, :provisioned_space, :used_space,
 :requested_by, :requested_date
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


#SCOPES
scope :ops_status, where('ops_status != ?', "Deleted")

#SEARCHABLES
searchable do
  text :name
  text :ip
  text :vm_hostname
  # text :vcenters do 
  #   vcenters.map{|vcenter| vcenter.name}
  # end
  # text :vdcs do 
  #   vdcs.map{|vdc| vdc.name}
  # end
  # text :clusters do 
  #   clusters.map{|cluster| cluster.name}
  # end
  # text :name do 
  #   vmhost.map{|vmhost| vmhost.name}
  # end
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
    # one cloud data

    one_cloud_dcs = import_ovdcs
    p "one cloud data center data imported"
    one_cloud_vms = import_ovms
    p "one cloud vm data imported"
    vcenter_data = vcenter_data_import
    p "vcenter data uploaded"
    data_center_data = data_center_data_import
    p "data center data uploaded"
    cluster_data = cluster_import
    p "vdc data uploaded" 
    esx_data = esx_data_import
    p "ESX Host data (vmhost) uploaded"
    esx_pnics_data = esx_pnics_data_import
    p "ESX pnic data uploaded"
    host_hbas_data = host_hbas_data_import
    p "Host hbas data uploaded"
    port_group_data = port_group_data_import
    p "port group data uploaded"

    # data_store_data = data_store_data_import
    # p "Data store data uploaded"
    vm_data = vm_data_import
    p "Vm  uploaded"
  end

def import_ovdcs
  # Ovdc.update_all(:ops_status=>"Deleted")

  
  CSV.foreach("csv_data/oc-all-vdcs.csv", :headers => true) do |row|
    ovdc = Ovdc.find_by_ovdc(row["ovdc"])
    if ovdc.present?
      # ovdc.ops_status = "Present"
      ovdc.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      ovdc = Ovdc.new
      # ovdc.ops_status = "New"
      ovdc.attributes = row.to_hash.slice(*accessible_attributes)
    end
    ovdc.org = row["org"]
    ovdc.ovdc= row["ovdc"]
    ovdc.storage_pct= row["storage-pct"]
    ovdc.mem_pct= row["mem-pct"]
    ovdc.cpu_pct= row["cpu-pct"]
    ovdc.st_limit= row["storageGB-limit"]
    ovdc.st_alloc= row["storageGB-alloc"]
    ovdc.st_used= row["storageGB-used"]
    ovdc.st_free= row["storageGB-free"]
    ovdc.mem_limit= row["memGB-limit"]
    ovdc.mem_alloc= row["memGB-alloc"]
    ovdc.mem_used= row["memGB-used"]
    ovdc.mem_free= row["memGB-free"]
    ovdc.cpu_limit= row["cpu-limit"]
    ovdc.cpu_alloc= row["cpu-alloc"]
    ovdc.cpu_used= row["cpu-used"]
    ovdc.save if ovdc.ovdc.present? 
  end
end

def import_ovms
  Ovm.update_all(:ops_status=>"Deleted")

  
  CSV.foreach("csv_data/oc-all-vms.csv", :headers => true) do |row|
    ovm = Ovm.find_by_ip(row["IP"])
    ovdc = Ovdc.find_by_ovdc(row["OrgVDC"])
    if ovm.present?
      ovm.ops_status = "Present"
      ovm.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      ovm = Ovm.new
      ovm.ops_status = "New"
      ovm.attributes = row.to_hash.slice(*accessible_attributes)
    end
    ovm.app_owner = row["Application Owner"]
    ovm.application = row["Application"]
    ovm.date_created = row["Date Created"]
    ovm.disk_gb = row["diskGB"]
    ovm.ip = row["IP"]
    ovm.mem_gb = row["memGB"]
    ovm.org = row["Organization"]
    ovm.os = row["OS"]
    ovm.ovdc_id = ovdc.id if ovdc.present?
    ovm.own_email = row["Owner Email"]
    ovm.status = row["status"]
    ovm.vapp_desc = row["vApp description"]
    ovm.vapp_name = row["vApp name"]
    ovm.vapp_status = row["vApp status"]
    ovm.vm_desc = row["VM description"]
    ovm.vm_name = row["VM name"]
    
    ovm.save if ovm.vm_name.present?
  end
end

# vcenter data
def vcenter_data_import
#  Vcenter.update_all(:ops_status=>"Deleted")

CSV.foreach("csv_data/powercli/esx/esx-vcenters.csv", :headers => true) do |row|
  vcenter = Vcenter.find_by_name(row["name"])
  if vcenter.present?
    vcenter.ops_status = "Present"
    vcenter.update_attributes(row.to_hash.slice(*accessible_attributes))
  else
    vcenter = Vcenter.new
    vcenter.ops_status = "New"
    vcenter.new_born_on = Date.today
    vcenter.attributes = row.to_hash.slice(*accessible_attributes)
  end
  vcenter.name = row["name"]
  vcenter.ip_address = row["ip"] if row["ip"].present?
  vcenter.description = row["description"]  if row["description"].present?
  vcenter.save if vcenter.name.present?
end
end

  # data center vdc data
  def data_center_data_import
 #   Vdc.update_all(:ops_status=>"Deleted")

 CSV.foreach("csv_data/powercli/esx/datacenters.csv", :headers => true) do |row|

  vcenter = Vcenter.find_by_name(row["vcserver"])
  vdc = Vdc.where(:name => row["datacenter"], :vcenter_id=>vcenter.id).first if vcenter.present?
  if vdc.present?
    vdc.ops_status = "Present"

    vdc.update_attributes(row.to_hash.slice(*accessible_attributes))
  else
    vdc = Vdc.new
    vdc.ops_status = "New"
    vdc.attributes = row.to_hash.slice(*accessible_attributes)
  end
  vdc.name = row["datacenter"]
  vdc.vcenter_id = vcenter.id if vcenter.present?
  vdc.save if vdc.vcenter_id.present?
end
end 

# Cluster data
def cluster_import
  #Cluster.update_all(:ops_status=>"Deleted")

  CSV.foreach("csv_data/powercli/esx/clusters.csv", :headers => true) do |row|

    vcenter = Vcenter.find_by_name(row["vcserver"])
    # vdc = Vdc.find_by_vcenter_id(vcenter.id)
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
    # cluster.vdc_id = vdc.id
    cluster.cpu_total_mhz = row["totalcpu"].to_i/1000
    cluster.mem_total_mb = row["totalmemory"].to_i/1000000
    cluster.cpu_no_cores = row["numcpucores"]
    cluster.vcenter_id = vcenter.id if vcenter.present?
    cluster.save! if cluster.name.present?
  end
end 

def esx_data_import
  Vmhost.update_all(:ops_status=>"Deleted")
  CSV.foreach("csv_data/powercli/esx/hosts.csv", :headers => true) do |row|
    vcenter = Vcenter.find_by_name(row["vcserver"])
    # cluster = Cluster.where(:vcenter_id=>vcenter.id).first
    # esx_host = Vmhost.where(:name=>row["vmhost"], :vcenter_id=> vcenter.id, :cluster_id=> cluster.id).first if cluster.present?
    esx_host = Vmhost.where(:name=>row["vmhost"], :vcenter_id=> vcenter.id).first if vcenter.present?

    if esx_host.present?
      esx_host.ops_status = "Present"
      esx_host.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      esx_host = Vmhost.new
      esx_host.ops_status = "New"
      esx_host.attributes = row.to_hash.slice(*accessible_attributes)
    end
    esx_host.vcenter_id = vcenter.id if vcenter.present?
  # esx_host.cluster_id = cluster.id if cluster.present?
  esx_host.name = row["vmhost"]
  esx_host.uuid = row["uuid"]
  esx_host.connection_state = row["connectionstate"]
  esx_host.power_state = row["powerstate"]
  esx_host.vendor = row["vendor"]
  esx_host.model = row["model"]
  esx_host.mem_total_mb = row["memorysize"]
  esx_host.cpu_model = row["cpumodel"]
  esx_host.cpu_total_mhz = row["cpuhz"].to_i/1000000
  esx_host.num_cpu = row["numcpupackages"]
  esx_host.num_core = row["numcpucores"]
  esx_host.esx_product = row["esxproductname"]
  esx_host.esx_version = row["esxversion"]
  esx_host.esx_build = row["esxbuild"]
  esx_host.serial_no = row["serialnumber"]
  esx_host.bios_version = row["biosversion"]
  esx_host.save if esx_host.name.present?
end
end
def esx_pnics_data_import
  Pnic.update_all(:ops_status=>"Deleted")

  CSV.foreach("csv_data/powercli/esx/pnics.csv", :headers => true) do |row|
    vmhost = Vmhost.find_by_name(row["vmhost"])
    pnic = Pnic.where(:name=>row["name"], :vmhost_id=>vmhost.id).first if vmhost.present?
    if pnic.present?
      pnic.ops_status = "Present"
      pnic.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      pnic = Pnic.new
      pnic.ops_status = "New"
      pnic.attributes = row.to_hash.slice(*accessible_attributes)
    end
    pnic.vmhost_id = vmhost.id if vmhost.present?
    pnic.name = row["pnic"]
    pnic.speed = row["speed"]
    pnic.macaddress = row["macaddress"]
    pnic.observed = row["observed"].split(" ")[0]
    pnic.save if pnic.name.present?
  end
  extra_pnics = Pnic.where(:ops_status=>"Deleted")
  extra_pnics.delete_all
end

def host_hbas_data_import
  Hhba.update_all(:ops_status=>"Deleted")

  CSV.foreach("csv_data/powercli/esx/hosthbas.csv", :headers => true) do |row|
    vmhost = Vmhost.find_by_name(row["vmhost"])
    hbas = Hhba.where(:vmhost_id=>vmhost.id, :name=>row["hba"]).first if vmhost.present?
    if hbas.present?
      hbas.ops_status = "Present"
      hbas.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      hbas = Hhba.new
      hbas.ops_status = "New"
      hbas.attributes = row.to_hash.slice(*accessible_attributes)
    end
    hbas.name = row["hba"]
    hbas.vmhost_id = vmhost.id if vmhost.present?
    hbas.status = row["status"]
    hbas.model = row["model"]
    hbas.driver = row["driver"]
    hbas.pci = row["pci"]
    hbas.wwnn = row["wwnn"]
    hbas.wwpn = row["wwpn"]

    hbas.save if hbas.name.present?
  end
  extra_hosts = Hhba.where(:ops_status=>"Deleted")
  extra_hosts.delete_all
end

def port_group_data_import
  Portgroup.update_all(:ops_status=>"Deleted")

  CSV.foreach("csv_data/powercli/esx/portgroups.csv", :headers => true) do |row|
    vmhost = Vmhost.find_by_name(row["vmhost"])
    pnic = Pnic.find_by_name(row["nic"])
    pg = Portgroup.where(:vmhost_id=>vmhost.id, :name=>row["portgroup"]).first if vmhost.present?
    if pg.present?
      pg.ops_status = "Present"
      pg.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      pg = Portgroup.new
      pg.ops_status = "New"
      pg.attributes = row.to_hash.slice(*accessible_attributes)
    end
    pg.name = row["portgroup"]
    pg.vmhost_id = vmhost.id if vmhost.present?
    pg.vswitch = row["vswitch"]
    pg.pnic_id = pnic.id if pnic.present?
    pg.a_s = row["activestandby"]

    pg.save if pg.name.present?
  end
  extra_pgs = Portgroup.where(:ops_status=>"Deleted")
  extra_pgs.delete_all
end


def data_store_data_import
  Datastore.update_all(:ops_status=>"Deleted")

  CSV.foreach("csv_data/powercli/esx/datastores.csv", :headers => true) do |row|
    vcenter = Vcenter.find_by_name(row["vcserver"])

    vdc = Vdc.find_by_name(row["data"])

    data_store = Datastore.where(:vcenter_id=>vcenter.id, :vdc_id=>vdc.id, :name => row["name"]).first
    if data_store.present?
      data_store.ops_status = "Present"
      data_store.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      data_store = Datastore.new
      data_store.ops_status = "New"
      data_store.attributes = row.to_hash.slice(*accessible_attributes)
    end
    data_store.name = row["name"]
    data_store.ds_id = row["id"]
    data_store.accessible = row["accessible"]
    data_store.url = row["url"]
    data_store.capacity = row["capacity"]
    data_store.freespace = row["freespace"]
    data_store.vcenter_id = vcenter.id
    data_store.vdc_id = vdc.id

    data_store.save
  end
  extra_data_stores = Datastore.where(:ops_status=>"Deleted")
  extra_data_stores.delete_all
end


def vm_data_import

  # Vm.update_all(:ops_status=>"Deleted")
  # Vm.update_all( :last_change=>Date.today-1) if 

  CSV.foreach("csv_data/powercli/esx/vms.csv", :headers => true) do |row|
    # vcenter = Vcenter.find_by_name(row["vcserver"])
    # vmhost = Vmhost.find_by_name(row["vmhost"])

    # cluster = Cluster.find_by_name(row["cluster"]) 
    vdc = Vdc.find_by_name(row["datacenter"])
    vm = Vm.find_by_ip(row["ipaddress"])
    
    if vm.present?
      vm.ops_status = "Present"
      vm.update_attributes(row.to_hash.slice(*accessible_attributes))
    else
      vm = Vm.new
      vm.ops_status = "New"
      vm.new_born_on = Date.today
      vm.attributes = row.to_hash.slice(*accessible_attributes)
    end

    vm.name = row["vmname"]
    vm.resource_pool = row["resourcepool"]
    # vm.status = row["id"]
    vm.vm_hostname = row["hostname"]
    vm.ip = row["ipaddress"]
    vm.total_mem_mb = row["memorymb"]
    vm.num_cpus = row["numcpu"]
    vm.num_vnics = row["qtynics"]
    vm.power_state = row["powerstate"]
    vm.connection_state = row["connectionstate"]
    vm.guest_state = row["gueststate"]
    vm.os = row["guestfullname"]
    vm.tools_version = row["toolsversion"]
    vm.tools_status = row["toolstatus"]
    vm.created_time = row["createdtime"]
    vm.created_by = row["createdby"]
    # vm.vcenter_id = vcenter.id if vcenter.present?
    vm.vdc_id = vdc.id if vdc.present?
    # vm.cluster_id = cluster.id if cluster.present?
    # vm.vmhost_id = vmhost.id if vmhost.present?
    vm.persistent_id = row["persistentid"]
    vm.vm_id = row["id"]
    vm.version = row["version"]
    vm.last_suspend = row["suspendtime"]
    vm.last_suspend_interval = row["suspendinterval"]
    vm.provisioned_space = row["provisionedspacegb"]
    vm.used_space = row["usedspacegb"]
    vm.save if vm.name.present?
  end
  CSV.foreach("csv_data/powercli/esx/vm-clusters.csv", :headers => true) do |row|
    vm_data= Vm.find_by_name(row["vmname"])
    vcenter = Vcenter.find_by_name(row["vcserver"])
    vmhost = Vmhost.find_by_name(row["vmhost"])
    cluster = Cluster.find_by_name(row["cluster"]) 

    if vmhost.present?
      vmhost.cluster_id = cluster.id if cluster.present?
      vmhost.save
    end
    if vm_data.present?
      vm_data.vcenter_id = vcenter.id if vcenter.present?
      vm_data.cluster_id = cluster.id if cluster.present?
      vm_data.vmhost_id = vmhost.id if vmhost.present?
      vm_data.save

    end
  end
  csv= CSV.read("csv_data/powercli/esx/vms.csv",:headers=>true)
  ips = Vm.all.collect(&:ip)
  deleted_vms = ips- csv['ipaddress'] 
  deleted_vms.each do |each_vm|
    deleted_vm = Vm.where(:ip=>each_vm).first
    deleted_vm.last_change= Date.today if deleted_vm.ops_status!="Deleted"
    deleted_vm.ops_status = "Deleted"
    deleted_vm.save
  end

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

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |vm|
      csv << vm.attributes.values_at(*column_names)
    end
  end
end 
