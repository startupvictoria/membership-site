class PasswordUpdateForm
  include ActiveModel::Model

  attr_accessor :token
  attr_accessor :password

  validates :password,
    length: {minimum: PasswordPolicy::MINIMUM_LENGTH}

  validate :ensure_token_is_usable

  def save
    return false unless valid?

    user = token.user

    User.transaction do
      token.deactivate

      user.password = password
      user.save!
    end

    true
  end

  private

  def ensure_token_is_usable
    unless token.present? && token.active?
      errors.add(:token, "is invalid")
    end
  end
end
