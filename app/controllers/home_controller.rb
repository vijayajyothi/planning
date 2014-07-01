class HomeController < ApplicationController
before_filter :authorize , :only => [:index] 
def index
  @vcenter_count= Vcenter.all.count
	@vdc_count= Vdc.all.count
  @vm_count= Vm.all.count
  @cluster_count =  Cluster.all.count
  @vmhost_count =  Vmhost.all.count
# raise @data.inspect
  end
end
