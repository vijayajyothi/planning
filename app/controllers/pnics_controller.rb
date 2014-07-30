class PnicsController < ApplicationController
  # GET /pnics
  # GET /pnics.json
  def index
    @pnics = Pnic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pnics }
    end
  end

  # GET /pnics/1
  # GET /pnics/1.json
  def show
    @pnic = Pnic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pnic }
    end
  end

  # GET /pnics/new
  # GET /pnics/new.json
  def new
    @pnic = Pnic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pnic }
    end
  end

  # GET /pnics/1/edit
  def edit
    @pnic = Pnic.find(params[:id])
  end

  # POST /pnics
  # POST /pnics.json
  def create
    @pnic = Pnic.new(params[:pnic])

    respond_to do |format|
      if @pnic.save
        format.html { redirect_to @pnic, notice: 'Pnic was successfully created.' }
        format.json { render json: @pnic, status: :created, location: @pnic }
      else
        format.html { render action: "new" }
        format.json { render json: @pnic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pnics/1
  # PUT /pnics/1.json
  def update
    @pnic = Pnic.find(params[:id])

    respond_to do |format|
      if @pnic.update_attributes(params[:pnic])
        format.html { redirect_to @pnic, notice: 'Pnic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pnic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pnics/1
  # DELETE /pnics/1.json
  def destroy
    @pnic = Pnic.find(params[:id])
    @pnic.destroy

    respond_to do |format|
      format.html { redirect_to pnics_url }
      format.json { head :no_content }
    end
  end
end
