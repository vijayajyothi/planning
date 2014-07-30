class StorageProcessorsController < ApplicationController
  # GET /storage_processors
  # GET /storage_processors.json
  def index
    @storage_processors = StorageProcessor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_processors }
    end
  end

  # GET /storage_processors/1
  # GET /storage_processors/1.json
  def show
    @storage_processor = StorageProcessor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_processor }
    end
  end

  # GET /storage_processors/new
  # GET /storage_processors/new.json
  def new
    @storage_processor = StorageProcessor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_processor }
    end
  end

  # GET /storage_processors/1/edit
  def edit
    @storage_processor = StorageProcessor.find(params[:id])
  end

  # POST /storage_processors
  # POST /storage_processors.json
  def create
    @storage_processor = StorageProcessor.new(params[:storage_processor])

    respond_to do |format|
      if @storage_processor.save
        format.html { redirect_to @storage_processor, notice: 'Storage processor was successfully created.' }
        format.json { render json: @storage_processor, status: :created, location: @storage_processor }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_processor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_processors/1
  # PUT /storage_processors/1.json
  def update
    @storage_processor = StorageProcessor.find(params[:id])

    respond_to do |format|
      if @storage_processor.update_attributes(params[:storage_processor])
        format.html { redirect_to @storage_processor, notice: 'Storage processor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_processor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_processors/1
  # DELETE /storage_processors/1.json
  def destroy
    @storage_processor = StorageProcessor.find(params[:id])
    @storage_processor.destroy

    respond_to do |format|
      format.html { redirect_to storage_processors_url }
      format.json { head :no_content }
    end
  end
end
