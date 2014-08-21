class Vcenter < ActiveRecord::Base
  attr_accessible :description, :ip_address, :name, :location, :new_born_on, :ops_status, :ip


#SCOPES
scope :ops_status, where('ops_status!=?', "Deleted")

# ASSOCIATIONS
has_many :portgroups
has_many :vdcs
has_many :vms
has_many :vmhosts
has_many :clusters
has_many :data_stores
has_many :vswitches

#Searchables
  searchable do
    text :name
    text :vmhosts do 
    vmhosts.map{|vmhost| vmhost.name}
  end
  end
end

