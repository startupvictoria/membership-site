ActiveAdmin.register Coupon do
   controller do
     defaults finder: :from_param
   end

  permit_params(
    :name,
    :teaser_name,
    :teaser_description,
    :comapny_name,
    :company_url,
    :company_about,
    :logo_filename,
    :description,
    :how_to_redeem,
  )
end
