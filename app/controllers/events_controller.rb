class EventsController < ApplicationController

  def index
    @events = \
      Event
        .all
        .map { |event| event.decorate }
  end

end
