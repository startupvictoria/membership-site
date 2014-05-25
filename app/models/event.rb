class Event < ActiveRecord::Base
  belongs_to :event_venue
  belongs_to :event_promoter

  just_define_datetime_picker :starts_at

  scope :upcoming, -> { where("starts_at > ?", Time.now) }
end
