class Appresource < ActiveRecord::Base
  attr_accessible :application_id, :service_id

 belongs_to:application
  belongs_to:service
end
