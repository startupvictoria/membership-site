class Event < ActiveRecord::Base
  audited

  belongs_to :event_venue
  belongs_to :event_organizer

  just_define_datetime_picker :starts_at

  scope :with_time_horizon, ->(time_horizon) do
    case time_horizon
      when :upcoming then where("starts_at > ?", Time.now).order("events.starts_at ASC")
      when :previous then where("starts_at <= ?", Time.now).order("events.starts_at DESC")
    end
  end

  scope :with_venue, ->(arg) do
    joins(:event_venue).where("event_venues.code IN (?)", arg) unless arg.nil?
  end

  scope :with_organizer, ->(arg) do
    joins(:event_organizer).where("event_organizers.code IN (?)", arg) unless arg.nil?
  end
end
