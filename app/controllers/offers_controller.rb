class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @offer = load_offer
  end

  private

  def load_offer
    Offer.from_param(params[:offer_id] || params[:id])
  end
end
