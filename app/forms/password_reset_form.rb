class PasswordResetForm
  include ActiveModel::Model

  validate :ensure_user_exists

  attr_accessor :email

  def save
    return false unless valid?

    token = PasswordResetToken.generate(user)

    PasswordResetToken.transaction do
      user.password_reset_tokens.each(&:deactivate)
      token.save!
    end

    PasswordResetMailer.reset_password(token).deliver

    true
  end

  private

  def ensure_user_exists
    unless user.present?
      errors.add(:email, "is invalid.")
    end
  end

  def user
    @_user ||= User.find_by_email(email)
  end
end
