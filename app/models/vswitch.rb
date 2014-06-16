class Vswitch < ActiveRecord::Base
  attr_accessible :name, :vcenter_id, :vdc_id, :vmhost_id
end
