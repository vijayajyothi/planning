class FieldLabelsController < ApplicationController
  # GET /field_labels
  # GET /field_labels.json
  def index
    @field_labels = FieldLabel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @field_labels }
    end
  end

  # GET /field_labels/1
  # GET /field_labels/1.json
  def show
    @field_label = FieldLabel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @field_label }
    end
  end

  # GET /field_labels/new
  # GET /field_labels/new.json
  def new
    @field_label = FieldLabel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @field_label }
    end
  end

  # GET /field_labels/1/edit
  def edit
    @field_label = FieldLabel.find(params[:id])
  end

  # POST /field_labels
  # POST /field_labels.json
  def create
    @field_label = FieldLabel.new(params[:field_label])

    respond_to do |format|
      if @field_label.save
        format.html { redirect_to @field_label, notice: 'Field label was successfully created.' }
        format.json { render json: @field_label, status: :created, location: @field_label }
      else
        format.html { render action: "new" }
        format.json { render json: @field_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /field_labels/1
  # PUT /field_labels/1.json
  def update
    @field_label = FieldLabel.find(params[:id])

    respond_to do |format|
      if @field_label.update_attributes(params[:field_label])
        format.html { redirect_to @field_label, notice: 'Field label was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @field_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_labels/1
  # DELETE /field_labels/1.json
  def destroy
    @field_label = FieldLabel.find(params[:id])
    @field_label.destroy

    respond_to do |format|
      format.html { redirect_to field_labels_url }
      format.json { head :no_content }
    end
  end
end
