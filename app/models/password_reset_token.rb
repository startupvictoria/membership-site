require 'securerandom'

class PasswordResetToken < ActiveRecord::Base
  belongs_to :user

  def self.generate(user)
    token = SecureRandom.urlsafe_base64(32)

    new(user: user, token: token, active: true)
  end

  def deactivate
    update_attributes!(active: false)
  end
end
