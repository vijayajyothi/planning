class Vdc < ActiveRecord::Base
  attr_accessible :description, :folder_id, :name, :vcenter_id
 belongs_to :vcenter
  has_many :vmhosts
  has_many :vms
  has_many :folders
  has_many :portgroups
  has_many :vswitches

searchable do
    text :name
  end
  
#SCOPES
scope :ops_status, where('ops_status!=?', "Deleted")

end
