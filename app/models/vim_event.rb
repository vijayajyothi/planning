class VimEvent < ActiveRecord::Base
  attr_accessible :event_message, :event_tag, :event_type, :time_stamp, :username, :vcenter_id, :vdc_id, :vm_id, :vmhost_id
 belongs_to :vcenter
  belongs_to :vmhost
  belongs_to :vm

  searchable do
    string :event_type
    string :username
    time :time_stamp
    integer :vm_id
  end

end
