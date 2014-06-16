class F5Vip < ActiveRecord::Base
  attr_accessible :application_id, :f5_cluster_id, :instance_id, :ip, :name, :port, :tier_id
end
