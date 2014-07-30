class Vmvip < ActiveRecord::Base
  attr_accessible :f5_vip_id, :vm_id
 belongs_to :vm
  belongs_to :f5_vip
end
