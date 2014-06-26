module ApplicationHelper

  def comment(&block)
  #block the content
end


def get_vdc(vcenter)
   @vdcs = Vdc.where(:vcenter_id=> vcenter.id)
end

def get_cluster(vcenter)
   @clusters = Cluster.where(:vcenter_id=> vcenter.id)
end
end
