class NewVmsController < ApplicationController
  # GET /new_vms
  # GET /new_vms.json
  def index
    @new_vms = NewVm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @new_vms }
    end
  end

  # GET /new_vms/1
  # GET /new_vms/1.json
  def show
    @new_vm = NewVm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @new_vm }
    end
  end

  # GET /new_vms/new
  # GET /new_vms/new.json
  def new
    @new_vm = NewVm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new_vm }
    end
  end

  # GET /new_vms/1/edit
  def edit
    @new_vm = NewVm.find(params[:id])
  end

  # POST /new_vms
  # POST /new_vms.json
  def create
    @new_vm = NewVm.new(params[:new_vm])

    respond_to do |format|
      if @new_vm.save
        format.html { redirect_to @new_vm, notice: 'New vm was successfully created.' }
        format.json { render json: @new_vm, status: :created, location: @new_vm }
      else
        format.html { render action: "new" }
        format.json { render json: @new_vm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /new_vms/1
  # PUT /new_vms/1.json
  def update
    @new_vm = NewVm.find(params[:id])

    respond_to do |format|
      if @new_vm.update_attributes(params[:new_vm])
        format.html { redirect_to @new_vm, notice: 'New vm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @new_vm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_vms/1
  # DELETE /new_vms/1.json
  def destroy
    @new_vm = NewVm.find(params[:id])
    @new_vm.destroy

    respond_to do |format|
      format.html { redirect_to new_vms_url }
      format.json { head :no_content }
    end
  end
end
