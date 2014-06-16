class SanSwitchesController < ApplicationController
  # GET /san_switches
  # GET /san_switches.json
  def index
    @san_switches = SanSwitch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @san_switches }
    end
  end

  # GET /san_switches/1
  # GET /san_switches/1.json
  def show
    @san_switch = SanSwitch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @san_switch }
    end
  end

  # GET /san_switches/new
  # GET /san_switches/new.json
  def new
    @san_switch = SanSwitch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @san_switch }
    end
  end

  # GET /san_switches/1/edit
  def edit
    @san_switch = SanSwitch.find(params[:id])
  end

  # POST /san_switches
  # POST /san_switches.json
  def create
    @san_switch = SanSwitch.new(params[:san_switch])

    respond_to do |format|
      if @san_switch.save
        format.html { redirect_to @san_switch, notice: 'San switch was successfully created.' }
        format.json { render json: @san_switch, status: :created, location: @san_switch }
      else
        format.html { render action: "new" }
        format.json { render json: @san_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /san_switches/1
  # PUT /san_switches/1.json
  def update
    @san_switch = SanSwitch.find(params[:id])

    respond_to do |format|
      if @san_switch.update_attributes(params[:san_switch])
        format.html { redirect_to @san_switch, notice: 'San switch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @san_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /san_switches/1
  # DELETE /san_switches/1.json
  def destroy
    @san_switch = SanSwitch.find(params[:id])
    @san_switch.destroy

    respond_to do |format|
      format.html { redirect_to san_switches_url }
      format.json { head :no_content }
    end
  end
end
