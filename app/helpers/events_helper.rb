module EventsHelper

# Build event for each of "many_dates"
# Each event is a hash requiring :name:, :start_at:, :end_at:, :activity_id:

# SAMPLE   <Event id: 6, 
# name: "Game vs Hutch Gold", 
# start_at: "2013-05-14 06:30:00", 
# end_at: "2013-05-14 07:30:00", 
# activity_id: "2"> 

# Need to create array of events to ultimately use create method to get into activerecord).  Starting with these params

# {"activity_id"=>"81",
#  "activity_name"=>"T11", 
#  "name"=>"T11 Event", 
#  "many_dates"=>"05/15/2013",  (dates_array)
#   "many_start_times(1i)"=>"2013", 
#   "many_start_times(2i)"=>"5", 
#   "many_start_times(3i)"=>"12", 
#   "many_start_times(4i)"=>"14", (start_hour)
#   "many_start_times(5i)"=>"00",  (start_min)
#    "many_end_times(1i)"=>"2013",
#     "many_end_times(2i)"=>"5", 
#     "many_end_times(3i)"=>"12", 
#      "many_end_times(4i)"=>"14",  (end_hour)
#       "many_end_times(5i)"=>"00"}   (end_min)

# rename params for easier use in methods
	# many_dates = params[:many_dates]
	# start_hour = params[:"many_start_times(4i)"]
	# start_min = params[:"many_start_times(5i)"]
	# end_hour = params[:"many_end_times(4i)"]
	# end_min = params[:"many_end_times(5i)"]
 	

# method to create time_string ('03/05/2010 14:25:00')from params (many_dates[index] "05/15/2013"), hour and min.  Then convert to proper event_time format.
	

	require 'date'

	def create_event_time(date, hour, minute)
		time_string = "#{date} #{hour}:#{minute}:00"
		
		event_time = DateTime.strptime(time_string, '%m/%d/%Y %H:%M:%S').in_time_zone

		return event_time

	end

# method to create an array of event times.  Will use this to create array of start_at times and end-at times
	# def make_event_times_array(dates_array, hour, min)
	# 	event_times = Array.new

	# 	dates_array.each_index do |index|
		
	# 		event_times[index] = create_event_time(dates_array[index],hour, min)

	# 	end
	# end

	def make_event_times_array(dates_array, hour, min)
		event_times = Array.new

		dates_array.each_index do |index|
		
			event_times[index] = create_event_time(dates_array[index],hour, min)
		end

		return event_times
	end

# Method to combine :start_at and :end_at to make hash for each event and put them in an array. 
	def create_event_array(start_at_array, end_at_array, event_name, activity_id)
		events_array = Array.new

		start_at_array.each_index do |index|
			event_hash = Hash.new

			event_hash[:start_at] = start_at_array[index]
			event_hash[:end_at] = end_at_array[index]
			event_hash[:name] = event_name
			event_hash[:activity_id] = activity_id

			events_array[index]= event_hash
		end

		return events_array
	end   
#########################

#create start_at and end_at arrays
	# start_at_array = make_event_times_array(many_dates,start_hour,start_min)
	# end_at_array = make_event_times_array(many_dates,end_hour. end_min)

#create event array using arrays just created along with other passed in params  
	# create_event_array(start_at_array, end_at_array, params[:name], params[:activity_id])    

# Call create method on array of event hashes and create activerecord for each
 	# Event.create([events_array])

end
