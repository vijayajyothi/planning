class F5PoolsController < ApplicationController
  # GET /f5_pools
  # GET /f5_pools.json
  def index
    @f5_pools = F5Pool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @f5_pools }
    end
  end

  # GET /f5_pools/1
  # GET /f5_pools/1.json
  def show
    @f5_pool = F5Pool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @f5_pool }
    end
  end

  # GET /f5_pools/new
  # GET /f5_pools/new.json
  def new
    @f5_pool = F5Pool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f5_pool }
    end
  end

  # GET /f5_pools/1/edit
  def edit
    @f5_pool = F5Pool.find(params[:id])
  end

  # POST /f5_pools
  # POST /f5_pools.json
  def create
    @f5_pool = F5Pool.new(params[:f5_pool])

    respond_to do |format|
      if @f5_pool.save
        format.html { redirect_to @f5_pool, notice: 'F5 pool was successfully created.' }
        format.json { render json: @f5_pool, status: :created, location: @f5_pool }
      else
        format.html { render action: "new" }
        format.json { render json: @f5_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f5_pools/1
  # PUT /f5_pools/1.json
  def update
    @f5_pool = F5Pool.find(params[:id])

    respond_to do |format|
      if @f5_pool.update_attributes(params[:f5_pool])
        format.html { redirect_to @f5_pool, notice: 'F5 pool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f5_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f5_pools/1
  # DELETE /f5_pools/1.json
  def destroy
    @f5_pool = F5Pool.find(params[:id])
    @f5_pool.destroy

    respond_to do |format|
      format.html { redirect_to f5_pools_url }
      format.json { head :no_content }
    end
  end
end
