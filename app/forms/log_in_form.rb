require 'active_model'

class LogInForm
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :password

  attr_accessor :authenticator

  def save
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      authenticator.log_in(user)
      true
    else
      errors.add(:email, "or password is invalid")
      false
    end
  end
end
