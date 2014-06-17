class Application < ActiveRecord::Base
  attr_accessible :business_owner, :description, :name, :notes
 has_many :appresources
  has_many :services,  :through => :appresources
  has_many :instances
  has_many :tiers, :through => :instances
  has_many :vms
  
  searchable do
    text :name
    text :services do
      services.map {|service| service.name}
    end
    text :vms do
      vms.map {|vm| vm.name}
    end
  end
end
