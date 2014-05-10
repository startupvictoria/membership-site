class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def logged_in?
    authenticator.logged_in?
  end
  helper_method :logged_in?

  def authenticator
    @_authenticator ||= Authenticator.new(session)
  end
end
