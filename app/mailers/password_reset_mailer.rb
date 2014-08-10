class PasswordResetMailer < StartupVictoriaMailer
  def reset_password(token)
    @token = token

    mail \
      to: token.user.email,
      from: default_from,
      subject: "Startup Victoria password reset confirmation"
  end
end
