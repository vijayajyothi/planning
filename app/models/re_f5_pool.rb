class ReF5Pool < ActiveRecord::Base
  attr_accessible :lb_method, :name, :pool_members, :pool_monitor, :pool_status, :re_f5_vip_id
end
