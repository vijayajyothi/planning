class F5Cluster < ActiveRecord::Base
  attr_accessible :access_ip, :data_center, :name, :network_list, :network_name_list, :primary_unit_ip, :primary_unit_name, :secondary_unit_ip, :secondary_unit_name
  has_many :f5_vips
  has_many :f5_pools
  has_many :f5_nodes
  searchable do
    text :name
    text :primary_unit_ip
    text :secondary_unit_ip
    text :f5_vips do
      f5_vips.map {|f5_vip| f5_vip.ip}
    end
    text :f5_pools do
      f5_pools.map {|f5_pool| f5_pool.name}
    end
    text :f5_nodes do
      f5_nodes.map {|f5_node| f5_node.ip}
    end
  end



#SCOPES
scope :ops_status, where('ops_status != ?', "Deleted")

class << self
  
def importing_f5_data
  f5cluster_data = f5cluster_data_import
  p "Done with f5Cluster data Import"

  f5_device_data  = f5_device_update
  p "Done with f5Devices -from prasad data Import"

    f5_data  = f5_data  #f5.csv update
    f5_onecloud  = f5_onecloud  #f5_onecloud data from capacity update.
    
    # f5vip_data = f5vip_data_import
    # p "Done with F5Vip data Import"

    # f5_vip_capacity_import = f5_vip_capacity
    # p "Done with F5 vip data from it-capacity data Import"

    # f5pool_data = f5_pool_import
    # p "Done with F5 pool data Import"
    # f5_pool_capacity_import = f5_pool_capacity_import
    # p "Done with f5_pool_capacity_import data Import"
    
    # f5_node_import = f5_node_import
    # p "Done with F5 node data Import"
    # f5_node_capacity_import = f5_node_capacity_import
    # p "Done with F5 node capacity data Import"
  end  

    # ActiveRecord::Base.connection.execute("TRUNCATE vmvips")

    def f5_data
      CSV.foreach("csv_data/f5/f5.csv", :headers => true) do |row|
        f5c = F5Cluster.find_by_access_ip(row[4])
        if f5c.blank?
          next
        end
        f5vip = {:name => row[5].sub(/\/Common\//,""),
          :ip => row[6],
          :port => row[7],
          :f5_cluster_id => f5c.id

        }
        t = F5Vip.find_or_initialize_by_name_and_f5_cluster_id(row[5].sub(/\/Common\//,""),f5c.id)
        t.attributes = f5vip
        if t.changed?
          # logmessage  "Changes to the F5VIP #{row[5]} #{t.changes.to_json}"
          t.save
        end  
        f5p = F5Pool.find_or_initialize_by_name_and_f5_vip_id(row[10].sub(/\/Common\//,""),t.id)
        f5p.lb_method = row[12]
        f5p.f5_cluster_id = f5c.id

        f5p.save

        f5n = F5Node.find_or_initialize_by_ip_and_port_and_f5_pool_id(row[14],row[15],f5p.id)
        f5n.node_enable = row[16]
        f5n.node_status = row[17]
        vm = Vm.find_by_ip(row[14])
        f5n.f5_cluster_id = f5c.id
        unless vm.blank?
          f5n.vm_id = vm.id
          vipvm = Vmvip.find_or_initialize_by_vm_id_and_f5_vip_id(vm.id,t.id)
          vipvm.save
          f5n.save
        end

      end
    end

    def f5_onecloud
      CSV.foreach("csv_data/f5/f5_onecloud.csv", :headers => true) do |row|
        f5c = F5Cluster.find_by_name(row["f5_cname"])
        if f5c.blank?
          next
        end
        f5vip = {:name => row["name"],
          :ip => row["ip"],
          :port => row["port"],
          :f5_cluster_id => f5c.id

        }
        t = F5Vip.find_or_initialize_by_name_and_f5_cluster_id(row["name"],f5c.id)
        t.attributes = f5vip
        if t.changed?
          t.save
        end  
        f5p = F5Pool.find_or_initialize_by_name_and_f5_vip_id(row["pool_name"],t.id)
        f5p.lb_method = row[7]+' '+row[8]
        f5p.f5_cluster_id = f5c.id

        f5p.save

        f5n = F5Node.find_or_initialize_by_ip_and_port_and_f5_pool_id(row["node_ip"],row["node_port"],f5p.id)
        f5n.f5_cluster_id = f5c.id
        f5n.f5_vip_id = t.id

        vm = Vm.find_by_ip(row["node_ip"])
        unless vm.blank?
          f5n.vm_id = vm.id
          vipvm = Vmvip.find_or_initialize_by_vm_id_and_f5_vip_id(vm.id,t.id)
          vipvm.save
        end
        f5n.save
      end
    end



    def f5cluster_data_import
      F5Cluster.update_all(:ops_status=>"Deleted")
    # F5Cluster.update_all(:active=>0)

    CSV.foreach("csv_data/f5/f5_clusters.csv", :headers => true) do |row|
      f5cluster = F5Cluster.find_by_name(row["Name"])
      if f5cluster.present?
        f5cluster.ops_status = "Present"
      else
        f5cluster = F5Cluster.new
        f5cluster.ops_status = "New"
        f5cluster.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5cluster.name = row["Name"]
      f5cluster.data_center = row["DataCenter"]
      f5cluster.primary_unit_ip = row["Primary Unit"]
      f5cluster.secondary_unit_ip = row["Secondary Unit"]
      f5cluster.primary_unit_name = row["primary_unit_name"]
      f5cluster.secondary_unit_name = row["secondary_unit_name"]
      f5cluster.network_list = row["Networks"]
      f5cluster.network_name_list = row["Use"]
      f5cluster.access_ip = row["Accss IP"]
      f5cluster.save if f5cluster.name.present?
    end
    delete_f5cluster = F5Cluster.where(:ops_status=>"Deleted")
    delete_f5cluster.delete_all
  end #cluster data import end


  def f5_device_update
    F5Device.update_all(:ops_status=>"Deleted")

    CSV.foreach("csv_data/f5/f5device_update.csv", :headers => true) do |row|
      f5device = F5Device.find_by_ip(row["mgmt-ip"])
      if f5device.present?
        f5device.ops_status = "Present"
      else
        f5device = F5Device.new
        f5device.ops_status = "New"
        f5device.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5device.name = row["lb-name"]
      f5device.ip = row["mgmt-ip"]
      f5device.status = row["lb-state"]
      f5device.save if f5device.ip.present?
    end
  end


  def f5vip_data_import
    F5Vip.update_all(:ops_status=>"Deleted")
    CSV.foreach("csv_data/f5/f5.csv", :headers => true) do |row|
      f5cluster = F5Cluster.where(:access_ip=>row[" Access IP"]).first
      f5v = F5Vip.where(:name=>row["Virtual Server Name"].sub(/\/Common\//,""), :f5_cluster_id =>f5cluster.id).first if f5cluster.present?
      if f5v.present?
        f5v.ops_status = "Present"
      else
        f5v = F5Vip.new
        f5v.ops_status = "New"
        f5v.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5v.name=row["Virtual Server Name"].sub(/\/Common\//,"") if row["Virtual Server Name"].present?
      f5v.ip=row["Virtual Server IP"]
      f5v.port = row[" Virtual Server Port"]
      f5v.vip_status = row[" VIP Status"]
      f5v.vip_enable = row[" VIP Enable Status"]
      f5v.f5_cluster_id = f5cluster.id if f5cluster.present?
      f5v.save if f5v.name.present?
    end
  end

  def f5_vip_capacity
    F5Vip.update_all(:ops_status =>"Deleted")
    CSV.foreach("csv_data/f5/f5_vip_capacity_new.csv", :headers => true) do |row|
      f5c = F5Cluster.where(:name=>row["f5cluster_name"]).first
      f5v = F5Vip.where(:name=>row["name"], :ip=>row["ip"], :f5_cluster_id=>f5c.id).first if f5c.present?
      if f5v.present?
        f5v.ops_status = "Present"
      else
        f5v = F5Vip.new
        f5v.ops_status = "New"
        f5v.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5v.name=row["name"]
      f5v.ip=row["ip"]
      f5v.port = row["port"]
      f5v.vip_status = "Not Available"
      f5v.vip_enable = "Not Available"
      f5v.f5_cluster_id = f5c.id if f5c.present?
      f5v.save if f5v.name.present?
    end
    # delete_f5 = F5Vip.where(:ops_status=>"Deleted")
    # delete_f5.delete_all
  end

  def f5_pool_import
    F5Pool.update_all(:ops_status=>"Deleted")
    CSV.foreach("csv_data/f5/f5.csv", :headers => true) do |row|
      f5cluster = F5Cluster.where(:access_ip=>row[" Access IP"]).first
      f5v = F5Vip.where(:name=>row["Virtual Server Name"].sub(/\/Common\//,""), :f5_cluster_id =>f5cluster.id).first if f5cluster.present?
      f5p = F5Pool.where(:name=>row[" Pool Name"].sub(/\/Common\//,""), :f5_vip_id =>f5v.id).first if f5v.present?
      if f5p.present?
        f5p.ops_status = "Present"
      else
        f5p = F5Pool.new
        f5p.ops_status = "New"
        f5p.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5p.f5_vip_id = f5v.id if f5v.present?
      f5p.name=row[" Pool Name"].sub(/\/Common\//,"") if row[" Pool Name"].present?
      f5p.f5_cluster_id = f5cluster.id if f5cluster.present?
      f5p.lb_method = row["LB Method"]
      f5p.pool_status = row[" Pool Status"]
      f5p.save 
    end
  end

  def f5_pool_capacity_import
    CSV.foreach("csv_data/f5/f5_pool_capacity.csv", :headers => true) do |row|
      f5c= F5Cluster.where(:name=>row[4]).first
      f5_vip = F5Vip.where(:name=>"#{row[3]}", :f5_cluster_id=>f5c.id).first
      # checked till here....
      f5p = F5Pool.where(:name=>row[0], :f5_vip_id=>f5_vip.id ).first if f5_vip.present?
      raise f5p.inspect
      if f5p.present?
        f5p.ops_status = "Present"
      else
        f5p = F5Pool.new
        f5p.ops_status = "New"
        f5p.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5p.f5_vip_id = f5_vip.id if f5_vip.present?
      f5p.name=row[0].sub(/\/Common\//,"") if row[0].present?
      f5p.f5_cluster_id = f5_vip.f5_cluster_id if f5_vip.present?
      f5p.lb_method = row[1]+" "+row[2] if f5p.present?
      f5p.pool_status = "Not Available"
      f5p.save 
    end
    delete_pools.delete_all
    delete_pools = F5Pool.where(:ops_status=>"Deleted")
  end

  def f5_node_import
    F5Node.update_all(:ops_status=>"Deleted")
    CSV.foreach("csv_data/f5/f5.csv", :headers => true) do |row|
      f5cluster = F5Cluster.where(:access_ip=>row[" Access IP"]).first
      f5v = F5Vip.where(:name=>row["Virtual Server Name"].sub(/\/Common\//,""), :f5_cluster_id =>f5cluster.id).first if f5cluster.present?
      f5p = F5Pool.where(:name=>row[" pool Name"].sub(/\/Common\//,"")).first if row[" pool Name"].present?
      f5n = F5Node.where(:ip=>row[" Node IP"], :port=>row[" Node Port"], :f5_pool_id =>f5p.id).first if f5p.present?
      vm = Vm.where(:ip=>row[" Node IP"]).first
      if f5n.present?
        f5n.ops_status = "Present"
      else
        f5n = F5Node.new
        f5n.ops_status = "New"
        f5n.attributes = row.to_hash.slice(*accessible_attributes)
      end
      f5n.ip = row[" Node IP"]
      f5n.port = row[" Node Port"]
      f5n.node_enable = row[" Node Enabled State"]
      f5n.node_status = row[" Node Status"] 
      f5n.f5_vip_id = f5v.id if f5v.present?
      f5n.f5_pool_id = f5p.id if f5p.present?
      f5n.vm_id = vm.id if vm.present?

      f5n.f5_cluster_id = f5cluster.id if f5cluster.present?
      f5n.save if f5n.ip.present?

 # delete_nodes = F5Node.where(:ops_status=>"Deleted")
# delete_nodes.delete_all

end
end

def f5_node_capacity_import
  CSV.foreach("csv_data/f5/f5_node_capacity.csv", :headers => true) do |row|
    f5ps = F5Pool.where(:name=>row["name"])
    f5ps.each do |f5p|

      f5n =  F5Node.where(:ip=>row["ip"], :f5_pool_id=>f5p.id).first if f5p.present?
      vm = Vm.where(:ip=>row["ip"]).first
      if f5n.present?
        f5n.ops_status = "Present"
      else
        f5n = F5Node.new
        f5n.ops_status = "New"
      # f5n.attributes = row.to_hash.slice(*accessible_attributes)
    end
    f5n.ip = row["ip"]
    f5n.port = row["port"]
    f5n.f5_vip_id = f5p.f5_vip_id if f5p.present?
    f5n.f5_pool_id = f5p.id if f5p.present?
    f5n.vm_id = vm.id if vm.present?

    f5n.f5_cluster_id = f5p.f5_cluster_id if f5p.present?
    f5n.save if f5n.ip.present?

  end
end
end


  end #self class end
end

