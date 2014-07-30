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
end
