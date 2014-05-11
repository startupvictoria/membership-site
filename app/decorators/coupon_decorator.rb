require 'draper'

class CouponDecorator < Draper::Decorator
  delegate_all

  def logo_path
    "/assets" + logo_filename
  end

end

