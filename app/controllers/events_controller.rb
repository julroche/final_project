class EventsController < ApplicationController

  include EventsHelper  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
     @event = Event.new
     
     begin
      @current_activity = Activity.find(params[:activity_id]).activity_name
    rescue
      @current_activity = "Activity was not saved."
    end

    @current_activity_id = params[:activity_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end


  def many_new
    @event = Event.new(params[:event])

    begin
      @current_activity = Activity.find(params[:activity_id]).activity_name
    rescue
      @current_activity = "Activity was not saved."
    end

  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])

    @current_activity = @event.activity.activity_name

    @current_activity_id = @event.activity.id


  end

  # POST /events
  # POST /events.json
  def create

    @many_dates = params[:event][:many_dates].split(',')
    @start_hour = params[:event][:"many_start_times(4i)"]
    @start_min = params[:event][:"many_start_times(5i)"]
    @end_hour = params[:event][:"many_end_times(4i)"]
    @end_min = params[:event][:"many_end_times(5i)"]

    require 'date'

    #create start_at and end_at arrays
    # @start_at_array = make_event_times_array(@many_dates,@start_hour,@start_min)

    @event_time1 = create_event_time("02/15/2013", "04", "30")

    @test_array = make_event_times_array(["05/14/2013", "06/16/2013"],"04", "30")


    @start_at_array = make_event_times_array(@many_dates,@start_hour, @start_min)

    @end_at_array = make_event_times_array(@many_dates,@end_hour, @end_min)

#create event array using arrays just created along with other passed in params  
  @events_array = create_event_array(@start_at_array, @end_at_array, params[:event][:name], params[:event][:activity_id])    

# Call create method on array of event hashes and create activerecord for each
  Event.create([@events_array])
    
    flash.now.alert = "Created #{@events_array.count} new events."

    redirect_to calendar_path(params[:event][:activity_id]), :notice => "Created #{@events_array.count} new events. Click on events to edit."

    # respond_to do |format|
    #   if @event.save
    #     # format.html { redirect_to @event, notice: 'Event was successfully created.' }
    #     format.html { redirect_to @event, notice: 'Event was successfully created.' }
    #     format.json { render json: @event, status: :created, location: @event }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to activity_path(@event.activity.id)}
      format.json { head :no_content }
    end
  end
end
