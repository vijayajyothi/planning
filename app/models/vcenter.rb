class Vcenter < ActiveRecord::Base
  attr_accessible :description, :ip, :name
 has_many :portgroups
  has_many :vdcs
  has_many :vms
  has_many :folders
  has_many :vmhosts
  has_many :clusters
  has_many :datastores
  has_many :vswitches
  has_many :vim_events
  searchable do
    text :name
    text :vms do
      vms.map {|vm| vm.name}
    end
    text :vmhosts do
      vmhosts.map {|vmhost| vmhost.name}
    end
  end
end
