class VswitchesController < ApplicationController
  # GET /vswitches
  # GET /vswitches.json
  def index
    @vswitches = Vswitch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vswitches }
    end
  end

  # GET /vswitches/1
  # GET /vswitches/1.json
  def show
    @vswitch = Vswitch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vswitch }
    end
  end

  # GET /vswitches/new
  # GET /vswitches/new.json
  def new
    @vswitch = Vswitch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vswitch }
    end
  end

  # GET /vswitches/1/edit
  def edit
    @vswitch = Vswitch.find(params[:id])
  end

  # POST /vswitches
  # POST /vswitches.json
  def create
    @vswitch = Vswitch.new(params[:vswitch])

    respond_to do |format|
      if @vswitch.save
        format.html { redirect_to @vswitch, notice: 'Vswitch was successfully created.' }
        format.json { render json: @vswitch, status: :created, location: @vswitch }
      else
        format.html { render action: "new" }
        format.json { render json: @vswitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vswitches/1
  # PUT /vswitches/1.json
  def update
    @vswitch = Vswitch.find(params[:id])

    respond_to do |format|
      if @vswitch.update_attributes(params[:vswitch])
        format.html { redirect_to @vswitch, notice: 'Vswitch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vswitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vswitches/1
  # DELETE /vswitches/1.json
  def destroy
    @vswitch = Vswitch.find(params[:id])
    @vswitch.destroy

    respond_to do |format|
      format.html { redirect_to vswitches_url }
      format.json { head :no_content }
    end
  end
end
