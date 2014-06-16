class Datastore < ActiveRecord::Base
  attr_accessible :accessible, :capacity, :ds_id, :freespace, :name, :url, :vcenter_id, :vdc_id
end
