class Vcenter < ActiveRecord::Base
  attr_accessible :description, :ip, :name, :location, :new_born_on


#SCOPES
scope :ops_status, where('ops_status!=?', "Deleted")

#Searchables
  searchable do
    text :name
  end
end

