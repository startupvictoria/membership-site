ActiveAdmin.register Coupon do
   controller do
     defaults finder: :from_param
   end

  permit_params(
    :name,
    :teaser_name,
    :teaser_description,
    :company_name,
    :company_url,
    :company_about,
    :logo_filename,
    :description,
    :how_to_redeem,
  )

  filter :name
  filter :teaser_description
  filter :company_url
  filter :created_at

  index do
    column :name
    column :teaser_description
    column :company_url do |coupon|
      link_to \
        coupon.company_url.gsub(%r{\w*://}, ""),
        coupon.company_url
    end
    column :created_at

    default_actions
  end

end
