class ReF5Vip < ActiveRecord::Base
  
  attr_accessible :address, :environment, :ip, :irules, :location, :name, :partition, :persistance_method, :poool_name, :vip_status
  #SEARCHABLES
searchable do
  text :name
  text :ip
  text :poool_name
  text :address
end


end
