module UserAuthentication

  Error = Class.new(Exception)
  Unauthorized = Class.new(Error)
  HiddenUnauthorized = Class.new(Unauthorized)

  def assert_authenticated
    unless logged_in?
      raise Unauthorized
    end
  end

end
