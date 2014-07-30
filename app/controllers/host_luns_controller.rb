class HostLunsController < ApplicationController
  # GET /host_luns
  # GET /host_luns.json
  def index
    @host_luns = HostLun.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @host_luns }
    end
  end

  # GET /host_luns/1
  # GET /host_luns/1.json
  def show
    @host_lun = HostLun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @host_lun }
    end
  end

  # GET /host_luns/new
  # GET /host_luns/new.json
  def new
    @host_lun = HostLun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @host_lun }
    end
  end

  # GET /host_luns/1/edit
  def edit
    @host_lun = HostLun.find(params[:id])
  end

  # POST /host_luns
  # POST /host_luns.json
  def create
    @host_lun = HostLun.new(params[:host_lun])

    respond_to do |format|
      if @host_lun.save
        format.html { redirect_to @host_lun, notice: 'Host lun was successfully created.' }
        format.json { render json: @host_lun, status: :created, location: @host_lun }
      else
        format.html { render action: "new" }
        format.json { render json: @host_lun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /host_luns/1
  # PUT /host_luns/1.json
  def update
    @host_lun = HostLun.find(params[:id])

    respond_to do |format|
      if @host_lun.update_attributes(params[:host_lun])
        format.html { redirect_to @host_lun, notice: 'Host lun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @host_lun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host_luns/1
  # DELETE /host_luns/1.json
  def destroy
    @host_lun = HostLun.find(params[:id])
    @host_lun.destroy

    respond_to do |format|
      format.html { redirect_to host_luns_url }
      format.json { head :no_content }
    end
  end
end
