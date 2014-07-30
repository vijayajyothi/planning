class StorageGroup < ActiveRecord::Base
  attr_accessible :hhba_id, :name, :storage_array_id, :vmhost_id
 belongs_to :storage_array
  belongs_to :hhba
  belongs_to :vmhost
  has_many :storage_group_luns
  has_many :storage_luns, :through => :storage_group_luns
  has_many :host_luns
end
