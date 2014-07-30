class Service < ActiveRecord::Base
  attr_accessible :category, :description, :name, :notes, :priority
has_many :appresources
  has_many :applications, :through => :appresources
searchable do
    text :name
    text :applications do
      applications.map {|application| application.name }
    end
  end
end
