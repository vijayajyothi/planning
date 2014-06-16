class NetworkSwitchesController < ApplicationController
  # GET /network_switches
  # GET /network_switches.json
  def index
    @network_switches = NetworkSwitch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @network_switches }
    end
  end

  # GET /network_switches/1
  # GET /network_switches/1.json
  def show
    @network_switch = NetworkSwitch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @network_switch }
    end
  end

  # GET /network_switches/new
  # GET /network_switches/new.json
  def new
    @network_switch = NetworkSwitch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @network_switch }
    end
  end

  # GET /network_switches/1/edit
  def edit
    @network_switch = NetworkSwitch.find(params[:id])
  end

  # POST /network_switches
  # POST /network_switches.json
  def create
    @network_switch = NetworkSwitch.new(params[:network_switch])

    respond_to do |format|
      if @network_switch.save
        format.html { redirect_to @network_switch, notice: 'Network switch was successfully created.' }
        format.json { render json: @network_switch, status: :created, location: @network_switch }
      else
        format.html { render action: "new" }
        format.json { render json: @network_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /network_switches/1
  # PUT /network_switches/1.json
  def update
    @network_switch = NetworkSwitch.find(params[:id])

    respond_to do |format|
      if @network_switch.update_attributes(params[:network_switch])
        format.html { redirect_to @network_switch, notice: 'Network switch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @network_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_switches/1
  # DELETE /network_switches/1.json
  def destroy
    @network_switch = NetworkSwitch.find(params[:id])
    @network_switch.destroy

    respond_to do |format|
      format.html { redirect_to network_switches_url }
      format.json { head :no_content }
    end
  end
end
