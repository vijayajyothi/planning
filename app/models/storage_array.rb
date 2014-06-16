class StorageArray < ActiveRecord::Base
  attr_accessible :agent_revision, :cabinet, :ip, :model, :model_type, :name, :prom_revision, :revision, :serial_no, :uid
end
