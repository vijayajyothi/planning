class VcentersController < ApplicationController
  before_filter :authorize 
  
  # GET /vcenters
  # GET /vcenters.json
  def index
    @vcenters = Vcenter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vcenters }
    end
  end

  # GET /vcenters/1
  # GET /vcenters/1.json
  def show
    @vcenter = Vcenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vcenter }
    end
  end

  # GET /vcenters/new
  # GET /vcenters/new.json
  def new
    @vcenter = Vcenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vcenter }
    end
  end

  # GET /vcenters/1/edit
  def edit
    @vcenter = Vcenter.find(params[:id])
  end

  # POST /vcenters
  # POST /vcenters.json
  def create
    @vcenter = Vcenter.new(params[:vcenter])

    respond_to do |format|
      if @vcenter.save
        format.html { redirect_to @vcenter, notice: 'Vcenter was successfully created.' }
        format.json { render json: @vcenter, status: :created, location: @vcenter }
      else
        format.html { render action: "new" }
        format.json { render json: @vcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vcenters/1
  # PUT /vcenters/1.json
  def update
    @vcenter = Vcenter.find(params[:id])

    respond_to do |format|
      if @vcenter.update_attributes(params[:vcenter])
        format.html { redirect_to @vcenter, notice: 'Vcenter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vcenters/1
  # DELETE /vcenters/1.json
  def destroy
    @vcenter = Vcenter.find(params[:id])
    @vcenter.destroy

    respond_to do |format|
      format.html { redirect_to vcenters_url }
      format.json { head :no_content }
    end
  end
end
