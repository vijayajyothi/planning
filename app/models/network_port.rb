class NetworkPort < ActiveRecord::Base
  attr_accessible :alias, :contact, :full_duplex, :if_alias, :if_index, :if_macaddress, :if_name, :ip, :name, :network_switch_id, :object_id, :speed_in, :speed_out, :type, :unique_id
  belongs_to :network_switch
  has_one :pnic
end
