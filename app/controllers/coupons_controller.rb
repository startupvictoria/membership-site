class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = load_coupon
  end

  private

  def load_coupon
    Coupon.from_param(params[:coupon_id] || params[:id])
  end
end
