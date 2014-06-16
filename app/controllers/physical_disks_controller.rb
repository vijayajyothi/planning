class PhysicalDisksController < ApplicationController
  # GET /physical_disks
  # GET /physical_disks.json
  def index
    @physical_disks = PhysicalDisk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @physical_disks }
    end
  end

  # GET /physical_disks/1
  # GET /physical_disks/1.json
  def show
    @physical_disk = PhysicalDisk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @physical_disk }
    end
  end

  # GET /physical_disks/new
  # GET /physical_disks/new.json
  def new
    @physical_disk = PhysicalDisk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @physical_disk }
    end
  end

  # GET /physical_disks/1/edit
  def edit
    @physical_disk = PhysicalDisk.find(params[:id])
  end

  # POST /physical_disks
  # POST /physical_disks.json
  def create
    @physical_disk = PhysicalDisk.new(params[:physical_disk])

    respond_to do |format|
      if @physical_disk.save
        format.html { redirect_to @physical_disk, notice: 'Physical disk was successfully created.' }
        format.json { render json: @physical_disk, status: :created, location: @physical_disk }
      else
        format.html { render action: "new" }
        format.json { render json: @physical_disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /physical_disks/1
  # PUT /physical_disks/1.json
  def update
    @physical_disk = PhysicalDisk.find(params[:id])

    respond_to do |format|
      if @physical_disk.update_attributes(params[:physical_disk])
        format.html { redirect_to @physical_disk, notice: 'Physical disk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @physical_disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_disks/1
  # DELETE /physical_disks/1.json
  def destroy
    @physical_disk = PhysicalDisk.find(params[:id])
    @physical_disk.destroy

    respond_to do |format|
      format.html { redirect_to physical_disks_url }
      format.json { head :no_content }
    end
  end
end
