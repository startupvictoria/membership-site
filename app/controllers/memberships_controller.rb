class MembershipsController < ApplicationController

  def new
    render locals: {registration_form: registration_form}
  end

  def create
    if registration_form.save
      flash[:notice] = "Payment Complete.  Welcome to Startup Victoria!"
      redirect_to dashboards_path
    else
      render :new, locals: {registration_form: registration_form}
    end
  end

  private

  def registration_form
    @_form ||= MembershipRegistrationForm.new(registration_params.merge(
      authenticator: authenticator
    ))
  end

  def registration_params
    params.fetch(:membership_registration_form, {}).permit(
      :full_name,
      :email,
      :password,
      :card_token
    )
  end

  def triplets
    [
      [ true,  false, "Thousands of dollars of discount coupons to startup products+services" ],
      [ true,  true,  "Discounted tickets to Startup Victoria events and workshops" ],
      [ true,  true,  "Early access to special offers and event tickets" ],
      [ true,  true,  "Access to peer networking events" ],
      [ true,  true,  "Virtual office hours" ],
      [ true,  true,  "Vote in Startup Victoria board elections" ],
      [ false, true,  "2 individual memberships included in business membership fee" ],
      [ true,  true,  "Share content with our membership base" ],
      [ false, true,  "Offer discounted products/services to our membership base" ],
      [ true,  false, "Participate in virtual office hours or mentorship programs" ]
    ].map do |a|
      { premium: a[0], business: a[1], feature: a[2] }
    end
  end
  helper_method :triplets

end
