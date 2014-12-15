class F5Device < ActiveRecord::Base
  attr_accessible :device, :ip, :status
  searchable do
    text :device
    text :status
  end
end
