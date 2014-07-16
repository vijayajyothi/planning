class VmhostsController < ApplicationController
  before_filter :authorize
  # GET /vmhosts
  # GET /vmhosts.json
  def index
   # @search = Vmhost.search do
   #    fulltext params[:search]
   #    paginate  :page => params[:page], :per_page=>15
   #  end
   #  @vmhosts = @search.results
     @vmhosts = Vmhost.page(params[:page]).per(14) 
     
  end

  # GET /vmhosts/1
  # GET /vmhosts/1.json
  def show
    @vmhost = Vmhost.find(params[:id])
    @vmhosts = Vmhost.where(:ops_status!="Deleted")
  end

  # GET /vmhosts/new
  # GET /vmhosts/new.json
  def new
    @vmhost = Vmhost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vmhost }
    end
  end

  # GET /vmhosts/1/edit
  def edit
    @vmhost = Vmhost.find(params[:id])
  end

  # POST /vmhosts
  # POST /vmhosts.json
  def create
    @vmhost = Vmhost.new(params[:vmhost])

    respond_to do |format|
      if @vmhost.save
        format.html { redirect_to @vmhost, notice: 'Vmhost was successfully created.' }
        format.json { render json: @vmhost, status: :created, location: @vmhost }
      else
        format.html { render action: "new" }
        format.json { render json: @vmhost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vmhosts/1
  # PUT /vmhosts/1.json
  def update
    @vmhost = Vmhost.find(params[:id])

    respond_to do |format|
      if @vmhost.update_attributes(params[:vmhost])
        format.html { redirect_to @vmhost, notice: 'Vmhost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vmhost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vmhosts/1
  # DELETE /vmhosts/1.json
  def destroy
    @vmhost = Vmhost.find(params[:id])
    @vmhost.destroy

    respond_to do |format|
      format.html { redirect_to vmhosts_url }
      format.json { head :no_content }
    end
  end

   def selected_vmhost
    @vmhost = Vmhost.find(params[:id])
    @vmhosts = Vmhost.where('ops_status != ?', "Deleted" )
  end
end
