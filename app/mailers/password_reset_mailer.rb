class PasswordResetMailer < ActionMailer::Base
  def reset_password(token)
    @token = token

    mail(
      to: token.user.email,
      from: "\"Startup Victoria\" <no-reply@startupvictoria.com.au>",
      subject: "Startup Victoria password reset confirmation"
    )
  end
end
