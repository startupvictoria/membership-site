ActiveAdmin.register User do

  actions :all, :except => [ :destroy ]

  action_item :edit, :only => [ :edit ], :if => proc { u = User.find(params[:id]); u && !u.is_member? } do
    link_to('Make This User A Member', make_member_admin_user_path(user))
  end

  member_action :make_member do
    user = User.find params[:id]

    CreatesMembership.new(
      user: resource,
      plan: MembershipPlan.free
    ).create_customer_and_membership

    flash[:notice] = "This user now has a free membership!"

    redirect_to admin_user_path(user)
  end

  permit_params \
    :email,
    :password,
    :full_name,
    :phone_number,
    :faction,
    :admin

  filter :email
  filter :full_name
  filter :phone_number
  filter :faction, as: :select, collection: proc { User.factions }
  filter :admin
  filter :created_at

  index do
    column :id
    column :email
    column :full_name
    column :phone_number
    column :faction
    column :admin
    column :membership_number do |u|
      u.membership_number
    end
    column :membership_plan do |u|
      u.is_member? ? u.membership.plan_id : "not a member"
    end
    column :created_at
    actions
  end

  csv do
    column :id
    column :email
    column :full_name
    column :phone_number
    column :faction
    column :admin
    column :membership_number do |u|
      u.membership_number
    end
    column :membership_plan do |u|
      u.is_member? ? u.membership.plan_id : "not a member"
    end
    column :created_at
  end

  show do
    attributes_table do
      row :id
      row :email
      row :full_name
      row :phone_number
      row :faction
      row :admin
      row "membership plan" do |u|
        u.is_member? ? u.membership.plan_id : "not a member"
      end
      row :created_at
     end

     active_admin_comments
  end

  form do |f|
    if f.object.errors.size >= 1
       f.inputs "Errors" do
         f.object.errors.full_messages.join('|')
       end
    end

    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :full_name
      f.input :phone_number
      f.input :faction,
        as: :radio,
        collection: User.factions.keys,
        selected: f.object.faction
      f.input :admin

    end

    f.actions
  end

end
