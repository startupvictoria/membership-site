def valid_card_details
  next_month = Time.now.next_month
  {
    name:            "Jim Bob",
    number:          "4242424242424242",
    exp_month:       next_month.month,
    exp_year:        next_month.year,
    cvc:             "123",
  }
end

def get_card_token_for_valid_card
  Stripe::Token.create(card: valid_card_details).id
end
