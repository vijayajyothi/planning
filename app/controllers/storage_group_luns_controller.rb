class StorageGroupLunsController < ApplicationController
  # GET /storage_group_luns
  # GET /storage_group_luns.json
  def index
    @storage_group_luns = StorageGroupLun.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_group_luns }
    end
  end

  # GET /storage_group_luns/1
  # GET /storage_group_luns/1.json
  def show
    @storage_group_lun = StorageGroupLun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_group_lun }
    end
  end

  # GET /storage_group_luns/new
  # GET /storage_group_luns/new.json
  def new
    @storage_group_lun = StorageGroupLun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_group_lun }
    end
  end

  # GET /storage_group_luns/1/edit
  def edit
    @storage_group_lun = StorageGroupLun.find(params[:id])
  end

  # POST /storage_group_luns
  # POST /storage_group_luns.json
  def create
    @storage_group_lun = StorageGroupLun.new(params[:storage_group_lun])

    respond_to do |format|
      if @storage_group_lun.save
        format.html { redirect_to @storage_group_lun, notice: 'Storage group lun was successfully created.' }
        format.json { render json: @storage_group_lun, status: :created, location: @storage_group_lun }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_group_lun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_group_luns/1
  # PUT /storage_group_luns/1.json
  def update
    @storage_group_lun = StorageGroupLun.find(params[:id])

    respond_to do |format|
      if @storage_group_lun.update_attributes(params[:storage_group_lun])
        format.html { redirect_to @storage_group_lun, notice: 'Storage group lun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_group_lun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_group_luns/1
  # DELETE /storage_group_luns/1.json
  def destroy
    @storage_group_lun = StorageGroupLun.find(params[:id])
    @storage_group_lun.destroy

    respond_to do |format|
      format.html { redirect_to storage_group_luns_url }
      format.json { head :no_content }
    end
  end
end
