class SanPortsController < ApplicationController
  # GET /san_ports
  # GET /san_ports.json
  def index
    @san_ports = SanPort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @san_ports }
    end
  end

  # GET /san_ports/1
  # GET /san_ports/1.json
  def show
    @san_port = SanPort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @san_port }
    end
  end

  # GET /san_ports/new
  # GET /san_ports/new.json
  def new
    @san_port = SanPort.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @san_port }
    end
  end

  # GET /san_ports/1/edit
  def edit
    @san_port = SanPort.find(params[:id])
  end

  # POST /san_ports
  # POST /san_ports.json
  def create
    @san_port = SanPort.new(params[:san_port])

    respond_to do |format|
      if @san_port.save
        format.html { redirect_to @san_port, notice: 'San port was successfully created.' }
        format.json { render json: @san_port, status: :created, location: @san_port }
      else
        format.html { render action: "new" }
        format.json { render json: @san_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /san_ports/1
  # PUT /san_ports/1.json
  def update
    @san_port = SanPort.find(params[:id])

    respond_to do |format|
      if @san_port.update_attributes(params[:san_port])
        format.html { redirect_to @san_port, notice: 'San port was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @san_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /san_ports/1
  # DELETE /san_ports/1.json
  def destroy
    @san_port = SanPort.find(params[:id])
    @san_port.destroy

    respond_to do |format|
      format.html { redirect_to san_ports_url }
      format.json { head :no_content }
    end
  end
end
