class F5Pool < ActiveRecord::Base
  attr_accessible :f5_cluster_id, :f5_vip_id, :lb_method, :name
end
