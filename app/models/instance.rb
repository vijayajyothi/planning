class Instance < ActiveRecord::Base
  attr_accessible :application_id, :description, :inst_id, :name
belongs_to :application
  has_many :tiers
  has_many :vms
end
