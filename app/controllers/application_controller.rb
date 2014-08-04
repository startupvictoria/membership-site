class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_raven_context

  include UserAuthentication

  protected

  def logged_in?
    authenticator.logged_in?
  end
  helper_method :logged_in?

  def current_user
    authenticator.current_user
  end
  helper_method :current_user

  def authenticate_admin_user!
    unless current_user.admin?
      redirect_to root_url
    end
  end

  def authenticator
    @_authenticator ||= ::Authenticator.new(session)
  end

  def set_raven_context
    if !current_user.nil?
      Raven.extra_context user_id: current_user.id, email: current_user.email
    end
  end

end
