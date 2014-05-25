ActiveAdmin.register Event do
  config.sort_order = "created_at_desc"

  permit_params(
    :title,
    :short_description,
    :event_venue_id,
    :event_promoter_id,
    :url,
    :starts_at,
  )

  sidebar :promoters_and_venues do
    ul do
      li link_to "Promoters", admin_event_promoters_path
      li link_to "Venues", admin_event_venues_path
    end
  end

  filter :title
  filter :event_venue
  filter :event_promoter

  index do
    column :title
    column :event_venue
    column :event_promoter
    column :created_at

    default_actions
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :short_description
      f.input :event_venue, :include_blank => false
      f.input :event_promoter, :include_blank => false
      f.input :url
      f.input :starts_at, :as => :just_datetime_picker
    end

    f.actions
  end
end
