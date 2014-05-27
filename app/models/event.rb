class Event < ActiveRecord::Base
  belongs_to :event_venue
  belongs_to :event_organizer

  scope :upcoming, -> { where("starts_at > ?", Time.now) }
end
