class HomeController < ApplicationController
before_filter :authorize , :only => [:index] 
def index
	@vm_count= Vm.all.count
# @data = Vm.map{|each_vm|{datacenter: each_vm.datacenter,cpus:each_company.numcpu}}
# raise @data.inspect
  end
end
