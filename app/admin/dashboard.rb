ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "New Members" do
          para "Last 7 days: #{User.with_membership.created_last_n_days(7).count}"
          para "Last 30 days: #{User.with_membership.created_last_n_days(30).count}"
        end

        panel "New members last 7 days" do
          table_for User.with_membership.last(5).reverse do
            column "Name" do |u|
              link_to(u.full_name, admin_member_path(u.id))
            end
            column "email", :email
            column "Faction", :faction
            column "Created_at", :created_at
          end
        end
      end

      column do
        panel "Membership Composition" do
          table_for admin_membership_subtotals do
            column "Faction", :faction
            column "count", :c
          end
        end
      end
    end
  end

  controller do
    def admin_membership_subtotals
      total = { faction: "TOTAL", c: User.with_membership.count }
      ret = User.
        with_membership.
        select("faction, count(*) AS c").
        group(:faction).
        map do |o|
          { faction: o.faction, c: o.c }
        end.sort do |a, b|
          b[:c] <=> a[:c]
        end
        ret.push total
        ret
    end
    helper_method :admin_membership_subtotals
  end
end
