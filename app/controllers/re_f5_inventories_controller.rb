class ReF5InventoriesController < ApplicationController
  # GET /re_f5_inventories
  # GET /re_f5_inventories.json
  def index
    count = ReF5Inventory.count
    @search = ReF5Inventory.search do
      fulltext params[:search]
      paginate  :page => params[:page], :per_page=>15
    end
    @re_f5_inventories = @search.results
  end

  # GET /re_f5_inventories/1
  # GET /re_f5_inventories/1.json
  def show
    @re_f5_inventory = ReF5Inventory.find(params[:id])
    @re_f5_inventories = ReF5Inventory.all

   
  end

  # GET /re_f5_inventories/new
  # GET /re_f5_inventories/new.json
  def new
    @re_f5_inventory = ReF5Inventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @re_f5_inventory }
    end
  end

  # GET /re_f5_inventories/1/edit
  def edit
    @re_f5_inventory = ReF5Inventory.find(params[:id])
  end

  # POST /re_f5_inventories
  # POST /re_f5_inventories.json
  def create
    @re_f5_inventory = ReF5Inventory.new(params[:re_f5_inventory])

    respond_to do |format|
      if @re_f5_inventory.save
        format.html { redirect_to @re_f5_inventory, notice: 'Re f5 inventory was successfully created.' }
        format.json { render json: @re_f5_inventory, status: :created, location: @re_f5_inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @re_f5_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /re_f5_inventories/1
  # PUT /re_f5_inventories/1.json
  def update
    @re_f5_inventory = ReF5Inventory.find(params[:id])

    respond_to do |format|
      if @re_f5_inventory.update_attributes(params[:re_f5_inventory])
        format.html { redirect_to @re_f5_inventory, notice: 'Re f5 inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @re_f5_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /re_f5_inventories/1
  # DELETE /re_f5_inventories/1.json
  def destroy
    @re_f5_inventory = ReF5Inventory.find(params[:id])
    @re_f5_inventory.destroy

    respond_to do |format|
      format.html { redirect_to re_f5_inventories_url }
      format.json { head :no_content }
    end
  end
   def re_selected_f5_inventory
    @re_f5_inventory = ReF5Inventory.find(params[:id])
    @re_f5_inventories= ReF5Inventory.where('ops_status != ?', "Deleted" )
  end
end
