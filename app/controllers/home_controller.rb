class HomeController < ApplicationController
  before_filter :authorize , :only => [:index] 

  def index
    @vcenter_count= Vcenter.ops_status.count
    @vdc_count= Vdc.ops_status.count
    @vm_count= Vm.ops_status.count
    @cluster_count =  Cluster.ops_status.count
    @vmhost_count =  Vmhost.ops_status.count
    @f5clusters_count = F5Cluster.ops_status.count
    @f5vips_count = F5Vip.ops_status.count
  end

  def search_list
    @search = Sunspot.search [Vcenter, Vdc, Cluster, Vmhost, Vm, F5Vip, F5Cluster, F5Device] do 
      fulltext params[:search]
    end
    @results = @search.results
  end 
end
