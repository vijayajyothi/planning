class DnsRecord < ActiveRecord::Base
  attr_accessible :f5_node_id, :f5_vip_id, :fqdn, :ip, :record_type, :vm_id
end
