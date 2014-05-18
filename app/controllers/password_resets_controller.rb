class PasswordResetsController < ApplicationController
  before_filter :ensure_token_accessible, only: [:show, :update]

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

  def show
    render locals: {password_update_form: password_update_form}
  end

  def update
    if password_update_form.save
      flash[:notice] = "Your password has been reset."
      redirect_to root_url
    else
      render :show, locals: {password_reset_form: password_reset_form}
    end
  end

  private

  def password_reset_form
    @_password_reset_form ||= PasswordResetForm.new(password_reset_params)
  end

  def password_reset_params
    params.fetch(:password_reset_form, {}).permit(:email)
  end

  def password_update_form
    @_password_update_form ||= PasswordUpdateForm.new(
      password_update_params.merge(token: token)
    )
  end

  def password_update_params
    params.fetch(:password_update_form, {}).permit(:password)
  end

  def token
    @_token ||= PasswordResetToken.from_param(params[:id])
  end

  def ensure_token_accessible
    unless token.present?
      redirect_to root_url
    end
  end
end
