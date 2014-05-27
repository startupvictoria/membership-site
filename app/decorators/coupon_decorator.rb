class CouponDecorator < Draper::Decorator
  delegate_all

  def has_logo?
    !logo_filename.empty?
  end

  def logo_path
    "coupons/" + logo_filename
  end

end
