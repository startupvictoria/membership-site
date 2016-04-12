ActiveAdmin.register Event do
  config.sort_order = "starts_at_asc"

  controller do
    def new
      super do |format|
        @event.starts_at = Time.zone.now.noon + 6.hours + 30.minutes
      end
    end
  end

  permit_params(
    :title,
    :short_description,
    :event_venue_id,
    :event_organizer_id,
    :url,
    :starts_at_date,
    :starts_at_time_hour,
    :starts_at_time_minute,
  )

  sidebar :organizers_and_venues do
    ul do
      li link_to "Organizers", admin_event_organizers_path
      li link_to "Venues", admin_event_venues_path
    end
  end

  filter :title
  filter :event_venue
  filter :event_organizer

  index do
    column :title
    column :event_venue
    column :event_organizer
    column "Start Date" do |event|
      event.starts_at.to_date
    end

    actions
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :short_description
      f.input :event_venue, :include_blank => false
      f.input :event_organizer, :include_blank => false
      f.input :url, placeholder: "http://example.com"
      f.input :starts_at, as: :just_datetime_picker
    end

    f.actions
  end
end
