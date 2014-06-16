class F5NodesController < ApplicationController
  # GET /f5_nodes
  # GET /f5_nodes.json
  def index
    @f5_nodes = F5Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @f5_nodes }
    end
  end

  # GET /f5_nodes/1
  # GET /f5_nodes/1.json
  def show
    @f5_node = F5Node.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @f5_node }
    end
  end

  # GET /f5_nodes/new
  # GET /f5_nodes/new.json
  def new
    @f5_node = F5Node.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @f5_node }
    end
  end

  # GET /f5_nodes/1/edit
  def edit
    @f5_node = F5Node.find(params[:id])
  end

  # POST /f5_nodes
  # POST /f5_nodes.json
  def create
    @f5_node = F5Node.new(params[:f5_node])

    respond_to do |format|
      if @f5_node.save
        format.html { redirect_to @f5_node, notice: 'F5 node was successfully created.' }
        format.json { render json: @f5_node, status: :created, location: @f5_node }
      else
        format.html { render action: "new" }
        format.json { render json: @f5_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /f5_nodes/1
  # PUT /f5_nodes/1.json
  def update
    @f5_node = F5Node.find(params[:id])

    respond_to do |format|
      if @f5_node.update_attributes(params[:f5_node])
        format.html { redirect_to @f5_node, notice: 'F5 node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @f5_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f5_nodes/1
  # DELETE /f5_nodes/1.json
  def destroy
    @f5_node = F5Node.find(params[:id])
    @f5_node.destroy

    respond_to do |format|
      format.html { redirect_to f5_nodes_url }
      format.json { head :no_content }
    end
  end
end
