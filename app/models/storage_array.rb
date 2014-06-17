class StorageArray < ActiveRecord::Base
  attr_accessible :agent_revision, :cabinet, :ip, :model, :model_type, :name, :prom_revision, :revision, :serial_no, :uid
has_many :storage_daes
  has_many :storage_groups
  has_many :storage_luns
  has_many :physical_disks, :through => :storage_daes
  has_many :vmhosts , :through => :storage_groups
  searchable do
    text :name
    text :ip
    text :serial_no
    text :model
    text :vmhosts do
      vmhosts.map {|vmhost| vmhost.name}
    end
  end
end
