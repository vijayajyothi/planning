class HwDevicesController < ApplicationController
  # GET /hw_devices
  # GET /hw_devices.json
  def index
    @hw_devices = HwDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hw_devices }
    end
  end

  # GET /hw_devices/1
  # GET /hw_devices/1.json
  def show
    @hw_device = HwDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hw_device }
    end
  end

  # GET /hw_devices/new
  # GET /hw_devices/new.json
  def new
    @hw_device = HwDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hw_device }
    end
  end

  # GET /hw_devices/1/edit
  def edit
    @hw_device = HwDevice.find(params[:id])
  end

  # POST /hw_devices
  # POST /hw_devices.json
  def create
    @hw_device = HwDevice.new(params[:hw_device])

    respond_to do |format|
      if @hw_device.save
        format.html { redirect_to @hw_device, notice: 'Hw device was successfully created.' }
        format.json { render json: @hw_device, status: :created, location: @hw_device }
      else
        format.html { render action: "new" }
        format.json { render json: @hw_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hw_devices/1
  # PUT /hw_devices/1.json
  def update
    @hw_device = HwDevice.find(params[:id])

    respond_to do |format|
      if @hw_device.update_attributes(params[:hw_device])
        format.html { redirect_to @hw_device, notice: 'Hw device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hw_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hw_devices/1
  # DELETE /hw_devices/1.json
  def destroy
    @hw_device = HwDevice.find(params[:id])
    @hw_device.destroy

    respond_to do |format|
      format.html { redirect_to hw_devices_url }
      format.json { head :no_content }
    end
  end
end
