class PortgroupsController < ApplicationController
  # GET /portgroups
  # GET /portgroups.json
  def index
    @portgroups = Portgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @portgroups }
    end
  end

  # GET /portgroups/1
  # GET /portgroups/1.json
  def show
    @portgroup = Portgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portgroup }
    end
  end

  # GET /portgroups/new
  # GET /portgroups/new.json
  def new
    @portgroup = Portgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portgroup }
    end
  end

  # GET /portgroups/1/edit
  def edit
    @portgroup = Portgroup.find(params[:id])
  end

  # POST /portgroups
  # POST /portgroups.json
  def create
    @portgroup = Portgroup.new(params[:portgroup])

    respond_to do |format|
      if @portgroup.save
        format.html { redirect_to @portgroup, notice: 'Portgroup was successfully created.' }
        format.json { render json: @portgroup, status: :created, location: @portgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @portgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portgroups/1
  # PUT /portgroups/1.json
  def update
    @portgroup = Portgroup.find(params[:id])

    respond_to do |format|
      if @portgroup.update_attributes(params[:portgroup])
        format.html { redirect_to @portgroup, notice: 'Portgroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @portgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portgroups/1
  # DELETE /portgroups/1.json
  def destroy
    @portgroup = Portgroup.find(params[:id])
    @portgroup.destroy

    respond_to do |format|
      format.html { redirect_to portgroups_url }
      format.json { head :no_content }
    end
  end
end
