require 'authenticator'

class AuthenticationController < ApplicationController
  def login
    render locals: {log_in_form: log_in_form}
  end

  def create
    if log_in_form.save
      redirect_to dashboards_path
    else
      render :login, locals: {log_in_form: log_in_form}
    end
  end

  def destroy
    authenticator.log_out
    redirect_to root_url
  end

  private

  def log_in_form
    @_log_in_form ||= LogInForm.new(log_in_params.merge(
      authenticator: authenticator
    ))
  end

  def log_in_params
    params.fetch(:log_in_form, {}).permit(
      :email,
      :password
    )
  end
end
