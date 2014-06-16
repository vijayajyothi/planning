class SearchTypesController < ApplicationController
  # GET /search_types
  # GET /search_types.json
  def index
    @search_types = SearchType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_types }
    end
  end

  # GET /search_types/1
  # GET /search_types/1.json
  def show
    @search_type = SearchType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search_type }
    end
  end

  # GET /search_types/new
  # GET /search_types/new.json
  def new
    @search_type = SearchType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search_type }
    end
  end

  # GET /search_types/1/edit
  def edit
    @search_type = SearchType.find(params[:id])
  end

  # POST /search_types
  # POST /search_types.json
  def create
    @search_type = SearchType.new(params[:search_type])

    respond_to do |format|
      if @search_type.save
        format.html { redirect_to @search_type, notice: 'Search type was successfully created.' }
        format.json { render json: @search_type, status: :created, location: @search_type }
      else
        format.html { render action: "new" }
        format.json { render json: @search_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /search_types/1
  # PUT /search_types/1.json
  def update
    @search_type = SearchType.find(params[:id])

    respond_to do |format|
      if @search_type.update_attributes(params[:search_type])
        format.html { redirect_to @search_type, notice: 'Search type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_types/1
  # DELETE /search_types/1.json
  def destroy
    @search_type = SearchType.find(params[:id])
    @search_type.destroy

    respond_to do |format|
      format.html { redirect_to search_types_url }
      format.json { head :no_content }
    end
  end
end
