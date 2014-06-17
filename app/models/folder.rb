class Folder < ActiveRecord::Base
  attr_accessible :description, :name, :parent_id
 has_many :vdcs
  has_many :vmhosts
  has_many :vms
end
