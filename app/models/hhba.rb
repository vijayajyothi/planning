class Hhba < ActiveRecord::Base
  attr_accessible :driver, :model, :name, :pci, :status, :vmhost_id, :wwnn, :wwpn
end
