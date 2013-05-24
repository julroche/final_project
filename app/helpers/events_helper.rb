module EventsHelper

	require 'date'

	def create_event_time(date, hour, minute)
		time_string = "#{date} #{hour}:#{minute}:00"
		
		event_time = DateTime.strptime(time_string, '%m/%d/%Y %H:%M:%S').in_time_zone

		return event_time

	end

# method to create an array of event times.  Will use this to create array of start_at times and end-at times

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



end
