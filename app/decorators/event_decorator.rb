class EventDecorator < Draper::Decorator
  delegate_all

  def starts_at_day
    starts_at.strftime("#{starts_at.day.ordinalize} %b")
  end

  def starts_at_hour
    starts_at.strftime("%l %p")
  end

end
