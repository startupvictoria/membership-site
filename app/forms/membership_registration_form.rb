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
    ret = false

    if valid?
      begin
        User.transaction do
          user.save!

          CreatesMembership.new(
            user: user,
            plan: MembershipPlan.premium,
            card_token: card_token
          ).call

          authenticator.log_in(user)
        end

        ret = true
      rescue Stripe::StripeError => e
        errors.add(e.param || :base, e.message)
      rescue ActiveRecord::RecordInvalid => e
        if e.message =~ /Email has already been taken/
          errors.add(:base, "This email address is already a member")
        else
          errors.add(:base, e.message)
        end
      end
    end

    ret
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
