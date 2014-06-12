class VdcsController < ApplicationController
  # GET /vdcs
  # GET /vdcs.json
  def index
    @vdcs = Vdc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vdcs }
    end
  end

  # GET /vdcs/1
  # GET /vdcs/1.json
  def show
    @vdc = Vdc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vdc }
    end
  end

  # GET /vdcs/new
  # GET /vdcs/new.json
  def new
    @vdc = Vdc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vdc }
    end
  end

  # GET /vdcs/1/edit
  def edit
    @vdc = Vdc.find(params[:id])
  end

  # POST /vdcs
  # POST /vdcs.json
  def create
    @vdc = Vdc.new(params[:vdc])

    respond_to do |format|
      if @vdc.save
        format.html { redirect_to @vdc, notice: 'Vdc was successfully created.' }
        format.json { render json: @vdc, status: :created, location: @vdc }
      else
        format.html { render action: "new" }
        format.json { render json: @vdc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vdcs/1
  # PUT /vdcs/1.json
  def update
    @vdc = Vdc.find(params[:id])

    respond_to do |format|
      if @vdc.update_attributes(params[:vdc])
        format.html { redirect_to @vdc, notice: 'Vdc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vdc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vdcs/1
  # DELETE /vdcs/1.json
  def destroy
    @vdc = Vdc.find(params[:id])
    @vdc.destroy

    respond_to do |format|
      format.html { redirect_to vdcs_url }
      format.json { head :no_content }
    end
  end
end
