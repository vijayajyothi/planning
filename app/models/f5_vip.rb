class F5Vip < ActiveRecord::Base
  attr_accessible :application_id, :f5_cluster_id, :instance_id, :ip, :name, :port, :tier_id

#ASSOCIATIONS
belongs_to :application
belongs_to :instance
belongs_to :tier
belongs_to :f5_cluster
has_many :dns_records
has_many :f5_pools
has_many :f5_nodes, :through => :f5_pools
has_many :vmvips
has_many :vms , :through => :vmvips


#SEARCHABLES
searchable do
  text :name
  text :ip
  integer :application_id
  integer :f5_cluster_id
  integer :tier_id
  integer :instance_id
  text :f5_pools do
    f5_pools.map {|f5_pool| f5_pool.name}
  end
  text :f5_nodes do
    f5_nodes.map {|f5_node| f5_node.ip}
  end
  text :vms do
    vms.map {|vm| vm.name}
  end
end



#SCOPES
scope :ops_status, where('ops_status != ?', "Deleted")
end
