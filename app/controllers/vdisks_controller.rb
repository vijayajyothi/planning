class VdisksController < ApplicationController
  # GET /vdisks
  # GET /vdisks.json
  def index
    @vdisks = Vdisk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vdisks }
    end
  end

  # GET /vdisks/1
  # GET /vdisks/1.json
  def show
    @vdisk = Vdisk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vdisk }
    end
  end

  # GET /vdisks/new
  # GET /vdisks/new.json
  def new
    @vdisk = Vdisk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vdisk }
    end
  end

  # GET /vdisks/1/edit
  def edit
    @vdisk = Vdisk.find(params[:id])
  end

  # POST /vdisks
  # POST /vdisks.json
  def create
    @vdisk = Vdisk.new(params[:vdisk])

    respond_to do |format|
      if @vdisk.save
        format.html { redirect_to @vdisk, notice: 'Vdisk was successfully created.' }
        format.json { render json: @vdisk, status: :created, location: @vdisk }
      else
        format.html { render action: "new" }
        format.json { render json: @vdisk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vdisks/1
  # PUT /vdisks/1.json
  def update
    @vdisk = Vdisk.find(params[:id])

    respond_to do |format|
      if @vdisk.update_attributes(params[:vdisk])
        format.html { redirect_to @vdisk, notice: 'Vdisk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vdisk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vdisks/1
  # DELETE /vdisks/1.json
  def destroy
    @vdisk = Vdisk.find(params[:id])
    @vdisk.destroy

    respond_to do |format|
      format.html { redirect_to vdisks_url }
      format.json { head :no_content }
    end
  end
end
