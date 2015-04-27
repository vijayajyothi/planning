class ReF5VipsController < ApplicationController
  before_filter :authorize

  # GET /re_f5_vips
  # GET /re_f5_vips.json
  def index
    # @re_f5_vips = ReF5Vip.all
    
    count = ReF5Vip.count
    @search = ReF5Vip.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>15
    end
    @re_f5_vips = @search.results
  end

  # GET /re_f5_vips/1
  # GET /re_f5_vips/1.json
  def show
    @re_f5_vip = ReF5Vip.find(params[:id])
    # @re_f5_vips = ReF5Vip.all
    @re_f5_vips = ReF5Vip.page(params[:page]).per(25) 
    
  end

  # GET /re_f5_vips/new
  # GET /re_f5_vips/new.json
  def new
    @re_f5_vip = ReF5Vip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @re_f5_vip }
    end
  end

  # GET /re_f5_vips/1/edit
  def edit
    @re_f5_vip = ReF5Vip.find(params[:id])
  end

  # POST /re_f5_vips
  # POST /re_f5_vips.json
  def create
    @re_f5_vip = ReF5Vip.new(params[:re_f5_vip])

    respond_to do |format|
      if @re_f5_vip.save
        format.html { redirect_to @re_f5_vip, notice: 'Re f5 vip was successfully created.' }
        format.json { render json: @re_f5_vip, status: :created, location: @re_f5_vip }
      else
        format.html { render action: "new" }
        format.json { render json: @re_f5_vip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /re_f5_vips/1
  # PUT /re_f5_vips/1.json
  def update
    @re_f5_vip = ReF5Vip.find(params[:id])

    respond_to do |format|
      if @re_f5_vip.update_attributes(params[:re_f5_vip])
        format.html { redirect_to @re_f5_vip, notice: 'Re f5 vip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @re_f5_vip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /re_f5_vips/1
  # DELETE /re_f5_vips/1.json
  def destroy
    @re_f5_vip = ReF5Vip.find(params[:id])
    @re_f5_vip.destroy

    respond_to do |format|
      format.html { redirect_to re_f5_vips_url }
      format.json { head :no_content }
    end
  end

   def re_selected_f5_vip
    @re_f5_vip = ReF5Vip.find(params[:id])
    @re_f5_vips= ReF5Vip.where('ops_status != ?', "Deleted" )
  end

end
