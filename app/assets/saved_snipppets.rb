
saved_snipppets.rb

Cal wiz 1 - activities controller

def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to many_new_path({:activity_id => @activity.id}), notice: 'Activity was successfully created. Now enter your events.' }
        format.json { render json: many_new_path, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  Cal wiz 2 - Events controller 

  def many_new
    @event = Event.new(params[:event])

    begin
      @current_activity = Activity.find(params[:activity_id]).activity_name
    rescue
      @current_activity = "Activity was not saved."
    end


    # @activity = 100
    # e_to_be_deleted = Events.find_all_by_activity_id(@activity.id)
    # e_to_be_deleted.destroy_all!
  
  end

    def create
    # @current_activity = Activity.find(params[:activity_id]).activity_name

    # @events = params[:all_event_hashes]
    # @events.each do |event_hash|
    #   Event.create(event_hash)
    # end

    # redirect_to lala_path, :notice => "Created #{@events.count} new events."

    # @event = Event.new(params[:event])

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

# params into create event

# {"activity_id"=>"81",
#  "activity_name"=>"T11", 
#  "name"=>"T11 Event", 
#  "many_dates"=>"05/15/2013",
#   "many_start_times(1i)"=>"2013", 
#   "many_start_times(2i)"=>"5", 
#   "many_start_times(3i)"=>"12", 
#   "many_start_times(4i)"=>"14", 
#   "many_start_times(5i)"=>"00",
#    "many_end_times(1i)"=>"2013",
#     "many_end_times(2i)"=>"5", 
#     "many_end_times(3i)"=>"12",
#      "many_end_times(4i)"=>"14",
#       "many_end_times(5i)"=>"00"}

# attributes needed to create event 

# <Event id: 6, 
# name: "Game vs Hutch Gold", 
# start_at: "2013-05-14 06:30:00", 
# end_at: "2013-05-14 07:30:00", 
# activity_id: "2"> 

# created_at: "2013-05-08 04:00:27", 
# updated_at: "2013-05-08 04:00:27", 




  

  