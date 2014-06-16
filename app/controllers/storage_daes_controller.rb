class StorageDaesController < ApplicationController
  # GET /storage_daes
  # GET /storage_daes.json
  def index
    @storage_daes = StorageDae.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_daes }
    end
  end

  # GET /storage_daes/1
  # GET /storage_daes/1.json
  def show
    @storage_dae = StorageDae.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_dae }
    end
  end

  # GET /storage_daes/new
  # GET /storage_daes/new.json
  def new
    @storage_dae = StorageDae.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_dae }
    end
  end

  # GET /storage_daes/1/edit
  def edit
    @storage_dae = StorageDae.find(params[:id])
  end

  # POST /storage_daes
  # POST /storage_daes.json
  def create
    @storage_dae = StorageDae.new(params[:storage_dae])

    respond_to do |format|
      if @storage_dae.save
        format.html { redirect_to @storage_dae, notice: 'Storage dae was successfully created.' }
        format.json { render json: @storage_dae, status: :created, location: @storage_dae }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_dae.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_daes/1
  # PUT /storage_daes/1.json
  def update
    @storage_dae = StorageDae.find(params[:id])

    respond_to do |format|
      if @storage_dae.update_attributes(params[:storage_dae])
        format.html { redirect_to @storage_dae, notice: 'Storage dae was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_dae.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_daes/1
  # DELETE /storage_daes/1.json
  def destroy
    @storage_dae = StorageDae.find(params[:id])
    @storage_dae.destroy

    respond_to do |format|
      format.html { redirect_to storage_daes_url }
      format.json { head :no_content }
    end
  end
end
