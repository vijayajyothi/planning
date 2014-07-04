class Vcenter < ActiveRecord::Base
  attr_accessible :description, :ip, :name, :location

#Searchables
  searchable do
    text :name
  end
end
