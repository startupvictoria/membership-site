require 'formats'

class MembershipRegistrationForm
  include ActiveModel::Model

  attr_accessor :full_name
  attr_accessor :email
  attr_accessor :password
  attr_accessor :phone_number
  attr_accessor :card_token
  attr_accessor :authenticator

  validates :full_name,
    presence: true

  validates :email,
    presence: true,
    format: {with: Formats::EMAIL}

  validates :password,
    length: {minimum: PasswordPolicy::MINIMUM_LENGTH}

  validates :card_token,
    presence: true

  def save
    return false unless valid?

    User.transaction do
      user.save!

      CreatesMembership.new(
        user: user,
        plan: MembershipPlan.premium,
        card_token: card_token
      ).call

      authenticator.log_in(user)
    end

    true
  rescue Stripe::StripeError => e
    errors.add(e.param || :base, e.message)
    false
  end

  def user
    @_user ||= User.new(
      full_name: full_name,
      email: email,
      password: password,
      phone_number: phone_number
    )
  end
end
