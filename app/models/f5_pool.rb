class F5Pool < ActiveRecord::Base
  attr_accessible :f5_cluster_id, :f5_vip_id, :lb_method, :name
 belongs_to :f5_vip
  belongs_to :f5_cluster
  has_many :f5_nodes
  has_many :vms , :through => :f5_nodes
end
