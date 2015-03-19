class OvmsController < ApplicationController
  before_filter :authorize
  
  # GET /ovms
  # GET /ovms.json
  def index
    count = Ovm.count
    @search = Ovm.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>15
      # paginate  :page => params[:page], :per_page=>count
    end
    @ovms = @search.results
  end

  # GET /ovms/1
  # GET /ovms/1.json
  def show
    @ovm = Ovm.find(params[:id])

   @ovms = Ovm.all
  end

  # GET /ovms/new
  # GET /ovms/new.json
  def new
    @ovm = Ovm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ovm }
    end
  end

  # GET /ovms/1/edit
  def edit
    @ovm = Ovm.find(params[:id])
  end

  def export_ovm
    @ovms = Ovm.all
    respond_to do |format|
      format.xlsx
      format.xls{ send_data @ovms.to_csv(col_sep: "\t") }
    end
  end 

  # POST /ovms
  # POST /ovms.json
  def create
    @ovm = Ovm.new(params[:ovm])

    respond_to do |format|
      if @ovm.save
        format.html { redirect_to @ovm, notice: 'Ovm was successfully created.' }
        format.json { render json: @ovm, status: :created, location: @ovm }
      else
        format.html { render action: "new" }
        format.json { render json: @ovm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ovms/1
  # PUT /ovms/1.json
  def update
    @ovm = Ovm.find(params[:id])

    respond_to do |format|
      if @ovm.update_attributes(params[:ovm])
        format.html { redirect_to @ovm, notice: 'Ovm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ovm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ovms/1
  # DELETE /ovms/1.json
  def destroy
    @ovm = Ovm.find(params[:id])
    @ovm.destroy

    respond_to do |format|
      format.html { redirect_to ovms_url }
      format.json { head :no_content }
    end
  end
  def selected_ovm
    @ovm = Ovm.find(params[:id])
    @ovms = Ovm.where('ops_status != ?', "Deleted" )
  end
end
