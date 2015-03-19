class Ovm < ActiveRecord::Base
  alias_attribute :name,:vm_name
  alias_attribute :power_state,:status

  attr_accessible :app_owner, :application, :date_created, :disk_gb, :ip, :mem_gb, :org, :os, :ovdc_id, :own_email, :status, :vapp_desc, :vapp_name, :vapp_status, :vm_desc, :vm_name
#SEARCHABLES
searchable do
  text :org
  text :vm_name
  text :vapp_name
  text :ip
end
end
