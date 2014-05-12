ActiveAdmin.register User do

  permit_params :email, :full_name, :admin

  filter :email
  filter :full_name
  filter :admin
  filter :created_at

  index do
    column :email
    column :full_name
    column :admin
    column :created_at

    default_actions
  end

end
