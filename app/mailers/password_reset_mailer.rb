class PasswordResetMailer < ActionMailer::Base
  def reset_password(token)
    @token = token

    mail(
      to: token.user.email,
      from: "no-reply@startupvictoria.com.au",
      subject: "Your password has been reset"
    )
  end
end
