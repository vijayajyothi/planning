class VmsController < ApplicationController
  before_filter :authorize
  
  # layout "vm_details", only:[:show]
  # before_filter :authorize  

  # GET /vms
  # GET /vms.json


  def index
    count = Vm.count
    @search = Vm.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>30
      # paginate  :page => params[:page], :per_page=>count
    end
    @vms = @search.results
    # raise @vms.count.inspect
    # @vms = Vm.page(params[:page]).per(14) 

    # respond_to do |format|
    #    format.html # index.html.erb
    #    format.json { render json: @vms }
    # end
  end

  def import
    Vm.update_all(:ops_status=>"Deleted")
    Vm.import(params[:file])
    redirect_to root_url, notice: "Clusters imported."
  end

  def export
    @deleted_vms = Vm.where(:ops_status=>"Deleted")
    respond_to do |format|
      format.html
      format.xlsx
      format.csv { send_data @deleted_vms.to_csv }
      format.xls{ send_data @deleted_vms.to_csv(col_sep: "\t") }
    end
  end  
  def export_all
    @vms = Vm.all
    respond_to do |format|
      format.xlsx
      format.xls{ send_data @vms.to_csv(col_sep: "\t") }
    end
  end  
  def linux_vms
    @vms = Vm.where("os like ? OR os like ?","%Linux%", "%Centos%")
    respond_to do |format|
      format.xlsx
      format.xls{ send_data @vms.to_csv(col_sep: "\t") }
    end
  end 
  def windows_vms
    @vms = Vm.where("os like ?","%Windows%")
    respond_to do |format|
      format.xlsx
      format.xls{ send_data @vms.to_csv(col_sep: "\t") }
    end
  end  

  def select_type
    raise "here"
    raise params[:data].inspect
  end

  def reports
    @datacenters = Vm.all.collect(&:vdc_id).uniq
  end

  def deleted_vms
    @vms = Vm.where(:ops_status=>"Deleted").uniq
  end

  def mail_deleted_vms
    @vms = Vm.where(:ops_status=>"Deleted").uniq
    OpsMailer.send_deleted_vms(@vms).deliver
  end

  # GET /vms/1
  # GET /vms/1.json
  def show
    @vm = Vm.find(params[:id])
    @vms = Vm.where('ops_status != ?', "Deleted" )

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @vm }
    # end
  end


  # GET /vms/new
  # GET /vms/new.json
  def new
    @vm = Vm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vm }
    end
  end

  # GET /vms/1/edit
  def edit
    @vm = Vm.find(params[:id])
  end 

  def edit_deleted_vm
    @vm = Vm.find(params[:id])
  end
def show_deleted_vm
    @vm = Vm.find(params[:id])
  end

  # POST /vms
  # POST /vms.json
  def create
    @vm = Vm.new(params[:vm])

    respond_to do |format|
      if @vm.save
        format.html { redirect_to @vm, notice: 'Vm was successfully created.' }
        format.json { render json: @vm, status: :created, location: @vm }
      else
        format.html { render action: "new" }
        format.json { render json: @vm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vms/1
  # PUT /vms/1.json
  def update
    @vm = Vm.find(params[:id])

@vms = Vm.all
    respond_to do |format|
      if @vm.update_attributes(params[:vm])
        format.js { redirect_to(vcenters_url)}

      else
        format.js { redirect_to(deleted_vms_url)}
      end
    end
  end

  # DELETE /vms/1
  # DELETE /vms/1.json
  def destroy
    @vm = Vm.find(params[:id])
    @vm.destroy
    redirect_to :action => :index, status:303

    # respond_to do |format|
    #   format.html { redirect_to vms_url }
    #   format.json { head :no_content }
    # end
  end

  
  def selected_vm
    @vm = Vm.find(params[:id])
    @vms = Vm.where('ops_status != ?', "Deleted" )
  end
end
