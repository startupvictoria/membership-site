class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all.order(:teaser_name).map { |coupon| coupon.decorate }
  end

  def show
    @coupon = load_coupon.decorate
  end

  private

  def load_coupon
    Coupon.from_param(params[:coupon_id] || params[:id])
  end
end
