class EventsController < ApplicationController

  def index
    @events = \
      Event
        .with_venue(params[:venue])
        .with_organizer(params[:organizer])
        .upcoming
        .all
        .map { |event| event.decorate }
  end

end
