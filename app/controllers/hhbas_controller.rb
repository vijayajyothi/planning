class HhbasController < ApplicationController
  # GET /hhbas
  # GET /hhbas.json
  def index
    @hhbas = Hhba.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hhbas }
    end
  end

  # GET /hhbas/1
  # GET /hhbas/1.json
  def show
    @hhba = Hhba.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hhba }
    end
  end

  # GET /hhbas/new
  # GET /hhbas/new.json
  def new
    @hhba = Hhba.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hhba }
    end
  end

  # GET /hhbas/1/edit
  def edit
    @hhba = Hhba.find(params[:id])
  end

  # POST /hhbas
  # POST /hhbas.json
  def create
    @hhba = Hhba.new(params[:hhba])

    respond_to do |format|
      if @hhba.save
        format.html { redirect_to @hhba, notice: 'Hhba was successfully created.' }
        format.json { render json: @hhba, status: :created, location: @hhba }
      else
        format.html { render action: "new" }
        format.json { render json: @hhba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hhbas/1
  # PUT /hhbas/1.json
  def update
    @hhba = Hhba.find(params[:id])

    respond_to do |format|
      if @hhba.update_attributes(params[:hhba])
        format.html { redirect_to @hhba, notice: 'Hhba was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hhba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hhbas/1
  # DELETE /hhbas/1.json
  def destroy
    @hhba = Hhba.find(params[:id])
    @hhba.destroy

    respond_to do |format|
      format.html { redirect_to hhbas_url }
      format.json { head :no_content }
    end
  end
end
