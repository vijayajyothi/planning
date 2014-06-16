class Service < ActiveRecord::Base
  attr_accessible :category, :description, :name, :notes, :priority
end
