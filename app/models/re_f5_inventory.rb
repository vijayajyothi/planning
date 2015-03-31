class ReF5Inventory < ActiveRecord::Base
alias_attribute :name, :hostname
  attr_accessible :admin_ip, :environment, :failover_mode, :failover_state, :floating_ip, :hostname, :location, :marketing_name, :peer_address, :peer_admin_ip, :re_f5_vip_ip, :serial, :version, :ops_status
searchable do
text :admin_ip
text :hostname
text :floating_ip
end
end
