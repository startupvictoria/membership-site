class UpdatePasswordPage < SimpleDelegator
  def initialize(session, token)
    @token = token
    super(session)
  end

  def visit
    super("/forgot-password/#{@token.to_param}")
  end

  def enter_new_password(password)
    fill_in "password_update_form[password]", with: password
    click_on "UPDATE PASSWORD"
  end
end
