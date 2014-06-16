class Tier < ActiveRecord::Base
  attr_accessible :application_id, :description, :instance_id, :name
end
