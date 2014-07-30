class StorageLunsController < ApplicationController
  # GET /storage_luns
  # GET /storage_luns.json
  def index
    @storage_luns = StorageLun.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_luns }
    end
  end

  # GET /storage_luns/1
  # GET /storage_luns/1.json
  def show
    @storage_lun = StorageLun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_lun }
    end
  end

  # GET /storage_luns/new
  # GET /storage_luns/new.json
  def new
    @storage_lun = StorageLun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_lun }
    end
  end

  # GET /storage_luns/1/edit
  def edit
    @storage_lun = StorageLun.find(params[:id])
  end

  # POST /storage_luns
  # POST /storage_luns.json
  def create
    @storage_lun = StorageLun.new(params[:storage_lun])

    respond_to do |format|
      if @storage_lun.save
        format.html { redirect_to @storage_lun, notice: 'Storage lun was successfully created.' }
        format.json { render json: @storage_lun, status: :created, location: @storage_lun }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_lun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_luns/1
  # PUT /storage_luns/1.json
  def update
    @storage_lun = StorageLun.find(params[:id])

    respond_to do |format|
      if @storage_lun.update_attributes(params[:storage_lun])
        format.html { redirect_to @storage_lun, notice: 'Storage lun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_lun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_luns/1
  # DELETE /storage_luns/1.json
  def destroy
    @storage_lun = StorageLun.find(params[:id])
    @storage_lun.destroy

    respond_to do |format|
      format.html { redirect_to storage_luns_url }
      format.json { head :no_content }
    end
  end
end
