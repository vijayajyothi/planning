class F5VipsController < ApplicationController
  before_filter :authorize
  
  # GET /f5_vips
  # GET /f5_vips.json
 
  def index
    # @f5_vips = F5Vip.all

    count = F5Vip.count
    @search = F5Vip.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>15
    end
    @f5_vips = @search.results

    
  end

  # GET /f5_vips/1
  # GET /f5_vips/1.json
  def show
    @f5_vip = F5Vip.find(params[:id])
    @f5_vips  = F5Vip.where(:ops_status!="Deleted")

  end

  # GET /f5_vips/new
  # GET /f5_vips/new.json
  def new
    @f5_vip = F5Vip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f5_vip }
    end
  end

  # GET /f5_vips/1/edit
  def edit
    @f5_vip = F5Vip.find(params[:id])
  end

  # POST /f5_vips
  # POST /f5_vips.json
  def create
    @f5_vip = F5Vip.new(params[:f5_vip])

    respond_to do |format|
      if @f5_vip.save
        format.html { redirect_to @f5_vip, notice: 'F5 vip was successfully created.' }
        format.json { render json: @f5_vip, status: :created, location: @f5_vip }
      else
        format.html { render action: "new" }
        format.json { render json: @f5_vip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f5_vips/1
  # PUT /f5_vips/1.json
  def update
    @f5_vip = F5Vip.find(params[:id])

    respond_to do |format|
      if @f5_vip.update_attributes(params[:f5_vip])
        format.html { redirect_to @f5_vip, notice: 'F5 vip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f5_vip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f5_vips/1
  # DELETE /f5_vips/1.json
  def destroy
    @f5_vip = F5Vip.find(params[:id])
    @f5_vip.destroy

    respond_to do |format|
      format.html { redirect_to f5_vips_url }
      format.json { head :no_content }
    end
  end

  def selected_f5_vip
    @f5_vip = F5Vip.find(params[:id])
    @f5_vips= F5Vip.where('ops_status != ?', "Deleted" )
  end

end
