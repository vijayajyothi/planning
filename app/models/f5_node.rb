class F5Node < ActiveRecord::Base
  attr_accessible :f5_cluster_id, :f5_pool_id, :ip, :port, :vm_id
belongs_to :f5_pool
  belongs_to :f5_cluster
  belongs_to :vm
  has_many :dns_records
end
