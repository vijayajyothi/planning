class F5Device < ActiveRecord::Base
  attr_accessible :name, :ip, :status
  searchable do
    text :name
    text :status
    text :ip
  end
end
