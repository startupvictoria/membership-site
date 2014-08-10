ActiveAdmin.register EventOrganizer do
  menu false

  config.filters = false

  controller do
    defaults finder: :from_param
  end

  permit_params(
    :code,
    :name,
    :url,
  )

  index do
    column :code
    column :name
    column :url do |ep|
      link_to \
        ep.url.gsub(%r{\w*://}, ""),
        ep.url
    end
    column :created_at

    actions
  end

end
