ActiveAdmin.register User, :as => "Member" do

  scope_to do
    Class.new do
      def self.members
        User.joins(:membership)
      end
    end
  end

  permit_params :email, :full_name, :faction, :admin

  filter :email
  filter :full_name
  filter :faction, as: :select, collection: proc { User.factions }
  filter :admin
  filter :created_at

  index do
    column :id
    column :email
    column :full_name
    column :faction
    column :admin
    column :created_at

    default_actions
  end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :full_name
      row :faction
      row :admin
      row :created_at
     end

     active_admin_comments
  end

  form do |f|
    f.inputs "UserDetails" do
      f.input :email
      f.input :full_name
      f.input :faction,
        as: :radio,
        collection: User.factions.keys,
        selected: f.object.faction
      f.input :admin
    end
    f.actions
  end

end
