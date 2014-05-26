class EventsController < ApplicationController

  def index
    @events = Event.upcoming.all.map { |event| event.decorate }
  end

end
