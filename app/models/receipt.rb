class Receipt < Struct.new(:user)

  def period_start
    invoice_date.to_date
  end

  def period_end
    (invoice_date + 1.year - 1.day).to_date
  end

  def created_at_ymd
    invoice_date.to_date
  end

  def invoice_id
    "#{user.id}-#{invoice_date.to_date}"
  end

  def amount
    cents = MembershipPlan.premium.price_cents

    cents % 100 == 0 ?
      "$#{cents/100}" :
      "$#{(cents.to_f/100).round(2)}"
  end

  private

  def invoice_date
    user.customer.created_at
  end

end
