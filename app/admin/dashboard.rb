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
              link_to(u.full_name, admin_user_path(u.id))
            end
            column "email", :email
            column "Faction", :faction
            column "Created_at", :created_at
          end
        end
      end

      column do
        panel "Users" do
          table_for admin_user_subtotals do
            column "type", :type
            column "count", :c
          end
        end

        panel "Membership Faction Composition" do
          table_for admin_membership_subtotals do
            column "Faction", :faction
            column "count", :c
          end
        end

        panel "Useful Links" do
          para link_to "Stripe", "https://stripe.com"
          para link_to "Mailer Previews", "/rails/mailers" if Rails.env.development?
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

    def admin_user_subtotals
      users_total         = User.count
      members_total       = User.with_membership.count
      members_premium     = User.with_membership_plan("premium").count
      members_free        = User.with_membership_plan("free").count
      members_problematic = members_total - members_premium - members_free

      ret = []
      ret.push({ type: "non members",              c: (users_total - members_total) })
      ret.push({ type: "premium members",          c: members_premium })
      ret.push({ type: "free members",             c: members_free })
      ret.push({ type: "TOTAL" ,                   c: users_total })

      if members_problematic > 0
        # This gives me comfort that if something goes screwy
        # with someone's user.membership.plan_id value, it'll be surfaced somewhere.
        # This is important because members vote in elections,
        # so if something's amiss with the membership roll we want to know about it.
        #
        ret.push({ type: "problematic members", c: members_problematic })
      end

      ret
    end
    helper_method :admin_user_subtotals

  end
end
