class VnicsController < ApplicationController
  # GET /vnics
  # GET /vnics.json
  def index
    @vnics = Vnic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vnics }
    end
  end

  # GET /vnics/1
  # GET /vnics/1.json
  def show
    @vnic = Vnic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vnic }
    end
  end

  # GET /vnics/new
  # GET /vnics/new.json
  def new
    @vnic = Vnic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vnic }
    end
  end

  # GET /vnics/1/edit
  def edit
    @vnic = Vnic.find(params[:id])
  end

  # POST /vnics
  # POST /vnics.json
  def create
    @vnic = Vnic.new(params[:vnic])

    respond_to do |format|
      if @vnic.save
        format.html { redirect_to @vnic, notice: 'Vnic was successfully created.' }
        format.json { render json: @vnic, status: :created, location: @vnic }
      else
        format.html { render action: "new" }
        format.json { render json: @vnic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vnics/1
  # PUT /vnics/1.json
  def update
    @vnic = Vnic.find(params[:id])

    respond_to do |format|
      if @vnic.update_attributes(params[:vnic])
        format.html { redirect_to @vnic, notice: 'Vnic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vnic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vnics/1
  # DELETE /vnics/1.json
  def destroy
    @vnic = Vnic.find(params[:id])
    @vnic.destroy

    respond_to do |format|
      format.html { redirect_to vnics_url }
      format.json { head :no_content }
    end
  end
end
