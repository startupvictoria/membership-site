ActiveAdmin.register Membership do

  menu false

  actions :none

  member_action :redirect_to_user do
    m = Membership.find params[:id]

    redirect_to admin_user_path(m.customer.user)
  end
end
