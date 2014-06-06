class HomeController < ApplicationController
before_filter :authorize , :only => [:index] 
def index
	@vm_count= Vm.all.count
# raise @data.inspect
  end
end
