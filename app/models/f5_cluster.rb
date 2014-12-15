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
    f5vip_data = f5vip_data_import
    p "Done with F5Vip data Import"
    f5pool_data = f5_pool_import
    p "Done with F5 pool data Import"
    f5_node_import = f5_node_import
    p "Done with F5 node data Import"
  end

  def updating_f5_data
    f5_device_data  = f5_device_update
  end

  def f5_device_update
    F5Device.update_all(:ops_status=>"Deleted")

    CSV.foreach("csv_data/f5/f5_update.csv", :headers => true) do |row|
     f5device = F5Device.find_by_ip(row["ip"])
     if f5device.present?
      f5device.ops_status = "Present"
    else
      f5device = F5Device.new
      f5device.ops_status = "New"

      f5device.attributes = row.to_hash.slice(*accessible_attributes)
    end
    f5device.name = row["lbname"]
    f5device.ip = row["ip"]
    f5device.status = row["status"]
    f5device.save if f5device.ip.present?


  end

end

def f5cluster_data_import
  F5Cluster.update_all(:ops_status=>"Deleted")
  F5Cluster.update_all(:active=>0)

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
  end #cluster data import end


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
      # f5v.application_id = 
      # f5v.instance.id =
      # f5v.tier_id =
      f5v.f5_cluster_id = f5cluster.id if f5cluster.present?
      f5v.save if f5v.name.present?
    end
  end

  def f5_pool_import
    F5Pool.update_all(:ops_status=>"Deleted")
    CSV.foreach("csv_data/f5/f5.csv", :headers => true) do |row|
      f5cluster = F5Cluster.where(:access_ip=>row[" Access IP"]).first
      f5v = F5Vip.where(:name=>row["Virtual Server Name"].sub(/\/Common\//,""), :f5_cluster_id =>f5cluster.id).first if f5cluster.present?
      f5p = F5Pool.where(:name=>row[" Pool Name"].sub(/\/Common\//,""), :f5_cluster_id =>f5cluster.id).first if f5cluster.present?
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

  def f5_node_import
    F5Node.update_all(:ops_status=>"Deleted")
    CSV.foreach("csv_data/f5/f5.csv", :headers => true) do |row|
      f5cluster = F5Cluster.where(:access_ip=>row[" Access IP"]).first
      f5v = F5Vip.where(:name=>row["Virtual Server Name"].sub(/\/Common\//,""), :f5_cluster_id =>f5cluster.id).first if f5cluster.present?
      f5p = F5Pool.where(:name=>row[" pool Name"].sub(/\/Common\//,"")).first if row[" pool Name"].present?
      f5n = F5Node.where(:ip=>row[" Node IP"], :port=>row[" Node Port"], :f5_pool_id =>f5p.id).first if f5p.present?
      vm = Vm.where(:ip=>row[" Node Ip"]).first
      # p vm
      # if vm.present?
      #   vipvm = Vmvip.where(:vm_id=>vm.id,:f5_vip_id=>f5v.id).first
      #   if vipvm.present?
      #   else
      #     vipvm.vm_id = vm.id
      #     vipvm.f5_vip_id = f5v.id
      #   end
      #   vipvm.save

      # end
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
      f5n.pool_id = f5p.id if f5p.present?
      f5n.vm_id = vm.id if vm.present?

      f5n.f5_cluster_id = f5cluster.id if f5cluster.present?
      f5n.save if f5n.ip.present?



    end
  end


  end #self class end
end

