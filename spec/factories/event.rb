FactoryBot.define do
  factory :event do
    # association :event_venue, factory: :event_venue, strategy: :build, code: "ybf"
    event_venue
    event_organizer
    title "The 21st Century CSIRO"
    starts_at Time.now
  end
end
