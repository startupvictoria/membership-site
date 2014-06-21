class CouponsController < ApplicationController

  def index
    @coupons = \
      Coupon.
        all.
        select do |coupon|
          logged_in? || coupon.name != 'learnable'
        end.
        map do |coupon|
          coupon.decorate
        end
  end

  def show
    @coupon = load_coupon.decorate
  end

  private

  def load_coupon
    Coupon.from_param(params[:coupon_id] || params[:id])
  end
end
