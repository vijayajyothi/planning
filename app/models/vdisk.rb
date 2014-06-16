class Vdisk < ActiveRecord::Base
  attr_accessible :capacitykb, :datastore_id, :filename, :format, :name, :persistence, :type, :vcenter_id, :vm_id
end
