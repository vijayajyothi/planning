class FibreCommectionsController < ApplicationController
  # GET /fibre_commections
  # GET /fibre_commections.json
  def index
    @fibre_commections = FibreCommection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fibre_commections }
    end
  end

  # GET /fibre_commections/1
  # GET /fibre_commections/1.json
  def show
    @fibre_commection = FibreCommection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fibre_commection }
    end
  end

  # GET /fibre_commections/new
  # GET /fibre_commections/new.json
  def new
    @fibre_commection = FibreCommection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fibre_commection }
    end
  end

  # GET /fibre_commections/1/edit
  def edit
    @fibre_commection = FibreCommection.find(params[:id])
  end

  # POST /fibre_commections
  # POST /fibre_commections.json
  def create
    @fibre_commection = FibreCommection.new(params[:fibre_commection])

    respond_to do |format|
      if @fibre_commection.save
        format.html { redirect_to @fibre_commection, notice: 'Fibre commection was successfully created.' }
        format.json { render json: @fibre_commection, status: :created, location: @fibre_commection }
      else
        format.html { render action: "new" }
        format.json { render json: @fibre_commection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fibre_commections/1
  # PUT /fibre_commections/1.json
  def update
    @fibre_commection = FibreCommection.find(params[:id])

    respond_to do |format|
      if @fibre_commection.update_attributes(params[:fibre_commection])
        format.html { redirect_to @fibre_commection, notice: 'Fibre commection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fibre_commection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fibre_commections/1
  # DELETE /fibre_commections/1.json
  def destroy
    @fibre_commection = FibreCommection.find(params[:id])
    @fibre_commection.destroy

    respond_to do |format|
      format.html { redirect_to fibre_commections_url }
      format.json { head :no_content }
    end
  end
end
