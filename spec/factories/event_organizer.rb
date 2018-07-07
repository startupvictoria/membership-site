FactoryBot.define do
  factory :event_organizer do
    sequence(:code) { |n| "code#{n}" }
    sequence(:name) { |n| "name#{n}" }
  end
end
