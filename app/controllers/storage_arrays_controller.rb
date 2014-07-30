class StorageArraysController < ApplicationController
  # GET /storage_arrays
  # GET /storage_arrays.json
  def index
    @storage_arrays = StorageArray.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_arrays }
    end
  end

  # GET /storage_arrays/1
  # GET /storage_arrays/1.json
  def show
    @storage_array = StorageArray.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_array }
    end
  end

  # GET /storage_arrays/new
  # GET /storage_arrays/new.json
  def new
    @storage_array = StorageArray.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_array }
    end
  end

  # GET /storage_arrays/1/edit
  def edit
    @storage_array = StorageArray.find(params[:id])
  end

  # POST /storage_arrays
  # POST /storage_arrays.json
  def create
    @storage_array = StorageArray.new(params[:storage_array])

    respond_to do |format|
      if @storage_array.save
        format.html { redirect_to @storage_array, notice: 'Storage array was successfully created.' }
        format.json { render json: @storage_array, status: :created, location: @storage_array }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_array.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_arrays/1
  # PUT /storage_arrays/1.json
  def update
    @storage_array = StorageArray.find(params[:id])

    respond_to do |format|
      if @storage_array.update_attributes(params[:storage_array])
        format.html { redirect_to @storage_array, notice: 'Storage array was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_array.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_arrays/1
  # DELETE /storage_arrays/1.json
  def destroy
    @storage_array = StorageArray.find(params[:id])
    @storage_array.destroy

    respond_to do |format|
      format.html { redirect_to storage_arrays_url }
      format.json { head :no_content }
    end
  end
end
