class MembershipCreatedMailer < ActionMailer::Base
  def create(user_id)
    @user = user = User.find(user_id)

    mail(
      to: user.email,
      from: "\"Startup Victoria\" <no-reply@startupvictoria.com.au>",
      subject: "Welcome to Startup Victoria"
    )
  end
end
