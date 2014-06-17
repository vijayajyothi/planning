class StorageGroupsController < ApplicationController
  # GET /storage_groups
  # GET /storage_groups.json
  def index
    @storage_groups = StorageGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_groups }
    end
  end

  # GET /storage_groups/1
  # GET /storage_groups/1.json
  def show
    @storage_group = StorageGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_group }
    end
  end

  # GET /storage_groups/new
  # GET /storage_groups/new.json
  def new
    @storage_group = StorageGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_group }
    end
  end

  # GET /storage_groups/1/edit
  def edit
    @storage_group = StorageGroup.find(params[:id])
  end

  # POST /storage_groups
  # POST /storage_groups.json
  def create
    @storage_group = StorageGroup.new(params[:storage_group])

    respond_to do |format|
      if @storage_group.save
        format.html { redirect_to @storage_group, notice: 'Storage group was successfully created.' }
        format.json { render json: @storage_group, status: :created, location: @storage_group }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_groups/1
  # PUT /storage_groups/1.json
  def update
    @storage_group = StorageGroup.find(params[:id])

    respond_to do |format|
      if @storage_group.update_attributes(params[:storage_group])
        format.html { redirect_to @storage_group, notice: 'Storage group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_groups/1
  # DELETE /storage_groups/1.json
  def destroy
    @storage_group = StorageGroup.find(params[:id])
    @storage_group.destroy

    respond_to do |format|
      format.html { redirect_to storage_groups_url }
      format.json { head :no_content }
    end
  end
end
