class OffersController < ApplicationController

  def index
    @offers = Offer.all.map { |offer| offer.decorate }
  end

  def show
    @offer = load_offer.decorate
  end

  private

  def load_offer
    Offer.from_param(params[:offer_id] || params[:id])
  end
end
