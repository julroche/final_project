class CalendarController < ApplicationController

  def index
  
    @activity = Activity.find(params[:id])
  	

    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    # @event_strips = Event.event_strips_for_month(@shown_month)
  	@event_strips = @activity.events.event_strips_for_month(@shown_month)
  
    @image_url = @activity.activity_icon

  end

  private

  def current_activity
    @current_activity ||= @activity
  end
  
end
