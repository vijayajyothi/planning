module ApplicationHelper


  # nginix path : usr/local/nginx/sbin/nginx
  # nginix editing path : usr/local/nginx/nginx.conf

  def comment(&block)
  #block the content
end


def get_ovms(ovdc)
 @vms = Ovm.where(:ovdc_id=> ovdc)
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
  return vdc
end
def my_cluster_host(vmhost_id)
  vmhost = Vmhost.where(:id=> vmhost_id).first
  cluster = Cluster.where(:id=> cluster.id).first
  return cluster
end
def my_vdc_name(vdc_id)
  vdc = Vdc.where(:id=> vdc_id).first
  return vdc
end

def my_vcenter(vcenter_id)
  vcenter = Vcenter.where(:id => vcenter_id).first
  return vcenter
end
def my_cluster(cluster_id)
  cluster = Cluster.where(:id=> cluster_id).first
end

def my_host(vmhost_id)
  vmhost = Vmhost.where(:id=>vmhost_id).first
end
def get_vms_by_host(vmhost_id)
  vms = Vm.where(:vmhost_id=> vmhost_id)
end

def vip_f5cluster(f5cluster_id)
  f5_cluster = F5Cluster.where(:id=>f5cluster_id).first
end

def get_vips(f5cluster_id)
  vips = F5Vip.where(:f5_cluster_id=>f5cluster_id)
  return vips
end
def url_sort(base,text)
		#raise text.inspect
		#css_class = text == sort_column ? "current #{sort_direction}" : nil
		#direction = text == sort_column && sort_direction == "asc" ? "desc" : "asc"
		#"/#{base}?sort=#{text}?direction=#{direction}"
		#link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
	end
	
	def css_sort(text)
		#css_class = text == sort_column ? "current #{sort_direction}" : nil
	end
end
