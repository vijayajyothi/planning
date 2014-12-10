class F5ClustersController < ApplicationController
  # GET /f5_clusters
  # GET /f5_clusters.json
  def index
    @f5_clusters = F5Cluster.all
  end

  # GET /f5_clusters/1
  # GET /f5_clusters/1.json
  def show
    @f5_cluster = F5Cluster.find(params[:id])
    @f5_clusters = F5Cluster.where('ops_status != ?', "Deleted" )

  end

  # GET /f5_clusters/new
  # GET /f5_clusters/new.json
  def new
    @f5_cluster = F5Cluster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f5_cluster }
    end
  end

  # GET /f5_clusters/1/edit
  def edit
    @f5_cluster = F5Cluster.find(params[:id])
  end

  # POST /f5_clusters
  # POST /f5_clusters.json
  def create
    @f5_cluster = F5Cluster.new(params[:f5_cluster])

    respond_to do |format|
      if @f5_cluster.save
        format.html { redirect_to @f5_cluster, notice: 'F5 cluster was successfully created.' }
        format.json { render json: @f5_cluster, status: :created, location: @f5_cluster }
      else
        format.html { render action: "new" }
        format.json { render json: @f5_cluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f5_clusters/1
  # PUT /f5_clusters/1.json
  def update
    @f5_cluster = F5Cluster.find(params[:id])

    respond_to do |format|
      if @f5_cluster.update_attributes(params[:f5_cluster])
        format.html { redirect_to @f5_cluster, notice: 'F5 cluster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f5_cluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f5_clusters/1
  # DELETE /f5_clusters/1.json
  def destroy
    @f5_cluster = F5Cluster.find(params[:id])
    @f5_cluster.destroy

    respond_to do |format|
      format.html { redirect_to f5_clusters_url }
      format.json { head :no_content }
    end
  end

   def selected_f5cluster
    @f5_cluster = F5Cluster.find(params[:id])
    @f5clusters = F5Cluster.where('ops_status != ?', "Deleted" )
  end

end
