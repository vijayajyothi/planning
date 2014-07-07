class Vcenter < ActiveRecord::Base
  attr_accessible :description, :ip, :name, :location


#SCOPES
scope :ops_status, where('ops_status!=?', "Deleted")

#Searchables
  searchable do
    text :name
  end
end
