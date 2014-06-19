class ReceiptsController < ApplicationController

  layout "dashboards"

  before_filter :assert_authenticated
  before_filter :enforce_correct_receipt_id, only: [:show]

  def index
    @receipts = receipts
  end

  def show
    @receipt = receipts.first
    @user = current_user
  end

  private

  def receipts
    [
      Receipt.new(current_user)
    ]
  end

  def enforce_correct_receipt_id
    raise HiddenUnauthorized unless params[:id] == receipts.first.invoice_id
  end

end
