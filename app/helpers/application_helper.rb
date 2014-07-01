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
def get_esx(vcenter)
 @esx = Vmhost.where(:vcenter_id=> vcenter.id)
end

def get_vms(cluster)
  @vms = Vm.where(:cluster_id=> cluster)
  end 

def my_vdc(vdc_id)
  vdc = Vdc.where(:id=> vdc_id).first
  return vdc.present? ? vdc.name : "No Value"
end

def my_vcenter(vcenter_id)
  vcenter = Vcenter.where(:id => vcenter_id).first
  return vcenter.present? ?  vcenter.name : "No Value"
  end
end
