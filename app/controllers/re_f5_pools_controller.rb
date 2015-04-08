class ReF5PoolsController < ApplicationController
  # GET /re_f5_pools
  # GET /re_f5_pools.json
  def index
    @re_f5_pools = ReF5Pool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @re_f5_pools }
    end
  end

  # GET /re_f5_pools/1
  # GET /re_f5_pools/1.json
  def show
    @re_f5_pool = ReF5Pool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @re_f5_pool }
    end
  end

  # GET /re_f5_pools/new
  # GET /re_f5_pools/new.json
  def new
    @re_f5_pool = ReF5Pool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @re_f5_pool }
    end
  end

  # GET /re_f5_pools/1/edit
  def edit
    @re_f5_pool = ReF5Pool.find(params[:id])
  end

  # POST /re_f5_pools
  # POST /re_f5_pools.json
  def create
    @re_f5_pool = ReF5Pool.new(params[:re_f5_pool])

    respond_to do |format|
      if @re_f5_pool.save
        format.html { redirect_to @re_f5_pool, notice: 'Re f5 pool was successfully created.' }
        format.json { render json: @re_f5_pool, status: :created, location: @re_f5_pool }
      else
        format.html { render action: "new" }
        format.json { render json: @re_f5_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /re_f5_pools/1
  # PUT /re_f5_pools/1.json
  def update
    @re_f5_pool = ReF5Pool.find(params[:id])

    respond_to do |format|
      if @re_f5_pool.update_attributes(params[:re_f5_pool])
        format.html { redirect_to @re_f5_pool, notice: 'Re f5 pool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @re_f5_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /re_f5_pools/1
  # DELETE /re_f5_pools/1.json
  def destroy
    @re_f5_pool = ReF5Pool.find(params[:id])
    @re_f5_pool.destroy

    respond_to do |format|
      format.html { redirect_to re_f5_pools_url }
      format.json { head :no_content }
    end
  end
end
