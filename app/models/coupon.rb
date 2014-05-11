class Coupon < ActiveRecord::Base
  def self.from_param(name)
    Coupon.find_by_name name.to_s
  end

  def to_param
    name
  end

end
