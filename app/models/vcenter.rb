class Vcenter < ActiveRecord::Base
  attr_accessible :description, :ip, :name

#Searchables
  searchable do
    text :name
  end
end
