class F5Cluster < ActiveRecord::Base
  attr_accessible :access_ip, :data_center, :name, :network_list, :network_name_list, :primary_unit_ip, :primary_unit_name, :secondary_unit_ip, :secondary_unit_name
end
