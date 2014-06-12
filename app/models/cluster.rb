class Cluster < ActiveRecord::Base
  attr_accessible :cpu_no_cores, :cpu_total_mhz, :mem_total_mb, :name, :vcenter_id, :vdc_id
end
