class PasswordResetsController < ApplicationController
  def index
    render locals: {password_reset_form: password_reset_form}
  end

  def create
    if password_reset_form.save
      flash[:notice] = "Check your email for password reset instructions."
      redirect_to root_url
    else
      render :index, locals: {password_reset_form: password_reset_form}
    end
  end

  private

  def password_reset_form
    @_password_reset_form ||= PasswordResetForm.new(password_reset_params)
  end

  def password_reset_params
    params.fetch(:password_reset_form, {}).permit(:email)
  end
end
