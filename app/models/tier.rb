class Tier < ActiveRecord::Base
  attr_accessible :application_id, :description, :instance_id, :name
 belongs_to :application
  belongs_to :instance
  has_many :vms
end
