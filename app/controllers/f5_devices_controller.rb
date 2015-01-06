class F5DevicesController < ApplicationController
  before_filter :authorize
  
  # GET /f5_devices
  # GET /f5_devices.json
  def index
    @search = F5Device.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>15
      # paginate  :page => params[:page], :per_page=>count
    end
    @f5_devices = @search.results

    # @f5_devices = F5Device.all
  end

  # GET /f5_devices/1
  # GET /f5_devices/1.json
  def show
    @f5_device = F5Device.find(params[:id])

    @f5_devices = F5Device.where('ops_status != ?', "Deleted" )
   
  end

  # GET /f5_devices/new
  # GET /f5_devices/new.json
  def new
    @f5_device = F5Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f5_device }
    end
  end

  # GET /f5_devices/1/edit
  def edit
    @f5_device = F5Device.find(params[:id])
  end

  # POST /f5_devices
  # POST /f5_devices.json
  def create
    @f5_device = F5Device.new(params[:f5_device])

    respond_to do |format|
      if @f5_device.save
        format.html { redirect_to @f5_device, notice: 'F5 device was successfully created.' }
        format.json { render json: @f5_device, status: :created, location: @f5_device }
      else
        format.html { render action: "new" }
        format.json { render json: @f5_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f5_devices/1
  # PUT /f5_devices/1.json
  def update
    @f5_device = F5Device.find(params[:id])

    respond_to do |format|
      if @f5_device.update_attributes(params[:f5_device])
        format.html { redirect_to @f5_device, notice: 'F5 device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f5_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f5_devices/1
  # DELETE /f5_devices/1.json
  def destroy
    @f5_device = F5Device.find(params[:id])
    @f5_device.destroy

    respond_to do |format|
      format.html { redirect_to f5_devices_url }
      format.json { head :no_content }
    end
  end

  def selected_f5_device
    @f5_device = F5Device.find(params[:id])
    @f5_devices = F5Device.where('ops_status != ?', "Deleted" )
  end

end
