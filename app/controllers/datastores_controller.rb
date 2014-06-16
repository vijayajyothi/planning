class DatastoresController < ApplicationController
  # GET /datastores
  # GET /datastores.json
  def index
    @datastores = Datastore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datastores }
    end
  end

  # GET /datastores/1
  # GET /datastores/1.json
  def show
    @datastore = Datastore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datastore }
    end
  end

  # GET /datastores/new
  # GET /datastores/new.json
  def new
    @datastore = Datastore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datastore }
    end
  end

  # GET /datastores/1/edit
  def edit
    @datastore = Datastore.find(params[:id])
  end

  # POST /datastores
  # POST /datastores.json
  def create
    @datastore = Datastore.new(params[:datastore])

    respond_to do |format|
      if @datastore.save
        format.html { redirect_to @datastore, notice: 'Datastore was successfully created.' }
        format.json { render json: @datastore, status: :created, location: @datastore }
      else
        format.html { render action: "new" }
        format.json { render json: @datastore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datastores/1
  # PUT /datastores/1.json
  def update
    @datastore = Datastore.find(params[:id])

    respond_to do |format|
      if @datastore.update_attributes(params[:datastore])
        format.html { redirect_to @datastore, notice: 'Datastore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datastore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datastores/1
  # DELETE /datastores/1.json
  def destroy
    @datastore = Datastore.find(params[:id])
    @datastore.destroy

    respond_to do |format|
      format.html { redirect_to datastores_url }
      format.json { head :no_content }
    end
  end
end
