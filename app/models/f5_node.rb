class F5Node < ActiveRecord::Base
  attr_accessible :f5_cluster_id, :f5_pool_id, :ip, :port, :vm_id
end
