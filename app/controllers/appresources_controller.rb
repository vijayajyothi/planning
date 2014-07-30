class AppresourcesController < ApplicationController
  # GET /appresources
  # GET /appresources.json
  def index
    @appresources = Appresource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appresources }
    end
  end

  # GET /appresources/1
  # GET /appresources/1.json
  def show
    @appresource = Appresource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appresource }
    end
  end

  # GET /appresources/new
  # GET /appresources/new.json
  def new
    @appresource = Appresource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appresource }
    end
  end

  # GET /appresources/1/edit
  def edit
    @appresource = Appresource.find(params[:id])
  end

  # POST /appresources
  # POST /appresources.json
  def create
    @appresource = Appresource.new(params[:appresource])

    respond_to do |format|
      if @appresource.save
        format.html { redirect_to @appresource, notice: 'Appresource was successfully created.' }
        format.json { render json: @appresource, status: :created, location: @appresource }
      else
        format.html { render action: "new" }
        format.json { render json: @appresource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appresources/1
  # PUT /appresources/1.json
  def update
    @appresource = Appresource.find(params[:id])

    respond_to do |format|
      if @appresource.update_attributes(params[:appresource])
        format.html { redirect_to @appresource, notice: 'Appresource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appresource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appresources/1
  # DELETE /appresources/1.json
  def destroy
    @appresource = Appresource.find(params[:id])
    @appresource.destroy

    respond_to do |format|
      format.html { redirect_to appresources_url }
      format.json { head :no_content }
    end
  end
end
