class NetworkPortsController < ApplicationController
  # GET /network_ports
  # GET /network_ports.json
  def index
    @network_ports = NetworkPort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @network_ports }
    end
  end

  # GET /network_ports/1
  # GET /network_ports/1.json
  def show
    @network_port = NetworkPort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @network_port }
    end
  end

  # GET /network_ports/new
  # GET /network_ports/new.json
  def new
    @network_port = NetworkPort.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @network_port }
    end
  end

  # GET /network_ports/1/edit
  def edit
    @network_port = NetworkPort.find(params[:id])
  end

  # POST /network_ports
  # POST /network_ports.json
  def create
    @network_port = NetworkPort.new(params[:network_port])

    respond_to do |format|
      if @network_port.save
        format.html { redirect_to @network_port, notice: 'Network port was successfully created.' }
        format.json { render json: @network_port, status: :created, location: @network_port }
      else
        format.html { render action: "new" }
        format.json { render json: @network_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /network_ports/1
  # PUT /network_ports/1.json
  def update
    @network_port = NetworkPort.find(params[:id])

    respond_to do |format|
      if @network_port.update_attributes(params[:network_port])
        format.html { redirect_to @network_port, notice: 'Network port was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @network_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_ports/1
  # DELETE /network_ports/1.json
  def destroy
    @network_port = NetworkPort.find(params[:id])
    @network_port.destroy

    respond_to do |format|
      format.html { redirect_to network_ports_url }
      format.json { head :no_content }
    end
  end
end
