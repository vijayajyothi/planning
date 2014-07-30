class SanSwitch < ActiveRecord::Base
  attr_accessible :boot_prom, :domain, :fabric_os, :factory_part_no, :ip, :kernel, :model, :name, :part_no, :serial_no, :state, :switch_id, :switch_type, :vendor, :wwn
end
