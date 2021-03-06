class VcentersController < ApplicationController
  before_filter :authorize 
  
  # GET /vcenters
  # GET /vcenters.json
  def index
    count = Vcenter.count
    @search = Vcenter.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>count
    end
    @vcenters = @search.results
    # old code(will paginate)
    # @vcenters = Vcenter.paginate(:page => params[:page], :per_page => 30, :page => params[:page])
 # using kaminari
# @vcenters = Vcenter.page(params[:page]).per(14)   
end

  # GET /vcenters/1
  # GET /vcenters/1.json
  def show
    @vcenter = Vcenter.find(params[:id])
    @vcenters = Vcenter.where('ops_status != ?', "Deleted" )

  end

  # GET /vcenters/new
  # GET /vcenters/new.json
  def new
    @vcenter = Vcenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vcenter }
    end
  end

  # GET /vcenters/1/edit
  def edit
    @vcenter = Vcenter.find(params[:id])
@vdcs = Vdc.all
  end

def update_versions
raise "here"
  @vdcs = Vdc.where(:id => params[:id]).all
  render :partial => "vdcs", :object => @vdcs
end
  # POST /vcenters
  # POST /vcenters.json
  def create
    @vcenter = Vcenter.new(params[:vcenter])

    respond_to do |format|
      if @vcenter.save
        format.html { redirect_to @vcenter, notice: 'Vcenter was successfully created.' }
        format.json { render json: @vcenter, status: :created, location: @vcenter }
      else
        format.html { render action: "new" }
        format.json { render json: @vcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vcenters/1
  # PUT /vcenters/1.json
  def update
    @vcenter = Vcenter.find(params[:id])
    @vcenters = Vcenter.where('ops_status != ?', "Deleted" )

    respond_to do |format|
      if @vcenter.update_attributes(params[:vcenter])
        format.js { redirect_to(vcenters_url)}
   
      else
        format.js { redirect_to(vcenters_url)}
        # redirect_to :action => :edit, status:303

        # format.html { render action: "edit" }
        # format.json { render json: @vcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vcenters/1
  # DELETE /vcenters/1.json
  
  def destroy
    @vcenter = Vcenter.find(params[:id])
    @vcenter.destroy
      redirect_to :action => :index, status:303
    # respond_to do |format|
    #   format.html { redirect_to vcenters_url }
    #   format.json { head :no_content }
    #   format.js { render :layout =>false}
    # end
  end
  def selected_vcenter
    @vcenter = Vcenter.find(params[:id])
    @vcenters = Vcenter.where('ops_status != ?', "Deleted" )
  end

  def search_list
    @search = Sunspot.search [Vcenter, Vdc, Cluster, Vmhost, Vm] do 
      fulltext params[:search]
    end
    @results = @search.results
  end 
end
