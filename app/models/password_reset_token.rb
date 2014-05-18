require 'securerandom'

class PasswordResetToken < ActiveRecord::Base
  belongs_to :user

  def self.generate(user)
    token = SecureRandom.urlsafe_base64(32)

    new(user: user, token: token, active: true)
  end

  def self.from_param(param)
    find_by_token(param)
  end

  def deactivate
    update_attributes!(active: false)
  end

  def to_param
    token
  end
end
