class ContactsController < ApplicationController
  def new
    render locals: {contact_form: contact_form}
  end

  def create
    if contact_form.save
      flash[:notice] = "Your message has been sent"
      redirect_to root_url
    else
      render :new, locals: {contact_form: contact_form}
    end
  end

  private

  def contact_form
    @_contact_form ||= ContactForm.new(contact_params)
  end

  def contact_params
    params.fetch(:contact_form, {}).permit(
      :email,
      :full_name,
      :phone,
      :message
    )
  end
end
