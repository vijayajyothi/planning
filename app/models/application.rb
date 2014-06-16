class Application < ActiveRecord::Base
  attr_accessible :business_owner, :description, :name, :notes
end
