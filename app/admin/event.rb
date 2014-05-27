ActiveAdmin.register Event do
  config.sort_order = "created_at_desc"

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
    :starts_at,
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
    column :created_at

    default_actions
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :short_description
      f.input :event_venue, :include_blank => false
      f.input :event_organizer, :include_blank => false
      f.input :url, placeholder: "http://example.com"
      f.input :starts_at
    end

    f.actions
  end
end
