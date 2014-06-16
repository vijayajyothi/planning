class VimEvent < ActiveRecord::Base
  attr_accessible :event_message, :event_tag, :event_type, :time_stamp, :username, :vcenter_id, :vdc_id, :vm_id, :vmhost_id
end
