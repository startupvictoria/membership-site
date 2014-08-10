class MembershipCreatedMailer < StartupVictoriaMailer
  def create(user_id)
    @user = user = User.find(user_id)

    mail \
      to: user.email,
      from: default_from,
      subject: "Welcome to Startup Victoria"
  end
  
  def notify(user_id)
    @user = user = User.find(user_id)

    mail \
      to: "new-member-notifications@startupvictoria.com.au",
      from: default_from,
      subject: "Startup Victoria has a new member: #{user.full_name}"
  end

end
