class PasswordResetPreview < ActionMailer::Preview
  def reset_password
    PasswordResetMailer.reset_password dummy_token
  end

  private

  def dummy_token
      PasswordResetToken.create \
        user: User.first,
        token: "aaaa",
        active: true
  end
end
