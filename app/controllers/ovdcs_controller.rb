class OvdcsController < ApplicationController
  # GET /ovdcs
  # GET /ovdcs.json
  def index
    count = Ovdc.count
    @search = Ovdc.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>15
      # paginate  :page => params[:page], :per_page=>count
    end
    @ovdcs = @search.results
  end

  # GET /ovdcs/1
  # GET /ovdcs/1.json
  def show
    @ovdc = Ovdc.find(params[:id])

    @ovdcs = Ovdc.all
  end

  # GET /ovdcs/new
  # GET /ovdcs/new.json
  def new
    @ovdc = Ovdc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ovdc }
    end
  end

  # GET /ovdcs/1/edit
  def edit
    @ovdc = Ovdc.find(params[:id])
  end

  # POST /ovdcs
  # POST /ovdcs.json
  def create
    @ovdc = Ovdc.new(params[:ovdc])

    respond_to do |format|
      if @ovdc.save
        format.html { redirect_to @ovdc, notice: 'Ovdc was successfully created.' }
        format.json { render json: @ovdc, status: :created, location: @ovdc }
      else
        format.html { render action: "new" }
        format.json { render json: @ovdc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ovdcs/1
  # PUT /ovdcs/1.json
  def update
    @ovdc = Ovdc.find(params[:id])

    respond_to do |format|
      if @ovdc.update_attributes(params[:ovdc])
        format.html { redirect_to @ovdc, notice: 'Ovdc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ovdc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ovdcs/1
  # DELETE /ovdcs/1.json
  def destroy
    @ovdc = Ovdc.find(params[:id])
    @ovdc.destroy

    respond_to do |format|
      format.html { redirect_to ovdcs_url }
      format.json { head :no_content }
    end
  end

  def selected_ovdc
    @ovdc = Ovdc.find(params[:id])
    # @ovdc = Ovdc.where('ops_status != ?', "Deleted" )
  end
end
