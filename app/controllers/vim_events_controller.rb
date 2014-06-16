class VimEventsController < ApplicationController
  # GET /vim_events
  # GET /vim_events.json
  def index
    @vim_events = VimEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vim_events }
    end
  end

  # GET /vim_events/1
  # GET /vim_events/1.json
  def show
    @vim_event = VimEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vim_event }
    end
  end

  # GET /vim_events/new
  # GET /vim_events/new.json
  def new
    @vim_event = VimEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vim_event }
    end
  end

  # GET /vim_events/1/edit
  def edit
    @vim_event = VimEvent.find(params[:id])
  end

  # POST /vim_events
  # POST /vim_events.json
  def create
    @vim_event = VimEvent.new(params[:vim_event])

    respond_to do |format|
      if @vim_event.save
        format.html { redirect_to @vim_event, notice: 'Vim event was successfully created.' }
        format.json { render json: @vim_event, status: :created, location: @vim_event }
      else
        format.html { render action: "new" }
        format.json { render json: @vim_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vim_events/1
  # PUT /vim_events/1.json
  def update
    @vim_event = VimEvent.find(params[:id])

    respond_to do |format|
      if @vim_event.update_attributes(params[:vim_event])
        format.html { redirect_to @vim_event, notice: 'Vim event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vim_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vim_events/1
  # DELETE /vim_events/1.json
  def destroy
    @vim_event = VimEvent.find(params[:id])
    @vim_event.destroy

    respond_to do |format|
      format.html { redirect_to vim_events_url }
      format.json { head :no_content }
    end
  end
end
