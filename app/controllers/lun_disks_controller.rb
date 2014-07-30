class LunDisksController < ApplicationController
  # GET /lun_disks
  # GET /lun_disks.json
  def index
    @lun_disks = LunDisk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lun_disks }
    end
  end

  # GET /lun_disks/1
  # GET /lun_disks/1.json
  def show
    @lun_disk = LunDisk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lun_disk }
    end
  end

  # GET /lun_disks/new
  # GET /lun_disks/new.json
  def new
    @lun_disk = LunDisk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lun_disk }
    end
  end

  # GET /lun_disks/1/edit
  def edit
    @lun_disk = LunDisk.find(params[:id])
  end

  # POST /lun_disks
  # POST /lun_disks.json
  def create
    @lun_disk = LunDisk.new(params[:lun_disk])

    respond_to do |format|
      if @lun_disk.save
        format.html { redirect_to @lun_disk, notice: 'Lun disk was successfully created.' }
        format.json { render json: @lun_disk, status: :created, location: @lun_disk }
      else
        format.html { render action: "new" }
        format.json { render json: @lun_disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lun_disks/1
  # PUT /lun_disks/1.json
  def update
    @lun_disk = LunDisk.find(params[:id])

    respond_to do |format|
      if @lun_disk.update_attributes(params[:lun_disk])
        format.html { redirect_to @lun_disk, notice: 'Lun disk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lun_disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lun_disks/1
  # DELETE /lun_disks/1.json
  def destroy
    @lun_disk = LunDisk.find(params[:id])
    @lun_disk.destroy

    respond_to do |format|
      format.html { redirect_to lun_disks_url }
      format.json { head :no_content }
    end
  end
end
