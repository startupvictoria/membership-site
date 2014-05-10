require 'active_model'
require 'formats'

class MembershipRegistrationForm
  include ActiveModel::Model

  attr_accessor :full_name
  attr_accessor :email
  attr_accessor :password
  attr_accessor :card_token

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

    user.save!

    CreatesMembership.new(
      user: user,
      plan: MembershipPlan.premium,
      card_token: card_token
    ).call

    true
  end

  def user
    @_user ||= User.new(
      full_name: full_name,
      email: email,
      password: password
    )
  end
end
