class Vdisk < ActiveRecord::Base
  attr_accessible :capacitykb, :datastore_id, :filename, :format, :name, :persistence, :type, :vcenter_id, :vm_id
 belongs_to :vm
  belongs_to :vcenter
  belongs_to :datastore
  searchable do
    integer :id
    integer :vm_id
    integer :datastore_id
  end
end
