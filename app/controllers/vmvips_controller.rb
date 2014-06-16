class VmvipsController < ApplicationController
  # GET /vmvips
  # GET /vmvips.json
  def index
    @vmvips = Vmvip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vmvips }
    end
  end

  # GET /vmvips/1
  # GET /vmvips/1.json
  def show
    @vmvip = Vmvip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vmvip }
    end
  end

  # GET /vmvips/new
  # GET /vmvips/new.json
  def new
    @vmvip = Vmvip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vmvip }
    end
  end

  # GET /vmvips/1/edit
  def edit
    @vmvip = Vmvip.find(params[:id])
  end

  # POST /vmvips
  # POST /vmvips.json
  def create
    @vmvip = Vmvip.new(params[:vmvip])

    respond_to do |format|
      if @vmvip.save
        format.html { redirect_to @vmvip, notice: 'Vmvip was successfully created.' }
        format.json { render json: @vmvip, status: :created, location: @vmvip }
      else
        format.html { render action: "new" }
        format.json { render json: @vmvip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vmvips/1
  # PUT /vmvips/1.json
  def update
    @vmvip = Vmvip.find(params[:id])

    respond_to do |format|
      if @vmvip.update_attributes(params[:vmvip])
        format.html { redirect_to @vmvip, notice: 'Vmvip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vmvip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vmvips/1
  # DELETE /vmvips/1.json
  def destroy
    @vmvip = Vmvip.find(params[:id])
    @vmvip.destroy

    respond_to do |format|
      format.html { redirect_to vmvips_url }
      format.json { head :no_content }
    end
  end
end
