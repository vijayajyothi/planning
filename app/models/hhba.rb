class Hhba < ActiveRecord::Base
  attr_accessible :driver, :model, :name, :pci, :status, :vmhost_id, :wwnn, :wwpn
 belongs_to :vmhost
  has_many :storage_groups
  has_many :host_luns
  
   searchable do
    integer :id
    integer :vmhost_id
  end
end
