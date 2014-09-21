class EventsController < ApplicationController

  private

  def events(time_horizon)
    Event
      .with_venue(params[:venue])
      .with_organizer(params[:organizer])
      .with_time_horizon(time_horizon)
      .all
      .map { |event| event.decorate }
  end
  helper_method :events

end
