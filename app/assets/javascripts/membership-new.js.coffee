membership_new_on_ready = ->
  stripe_response_handler = (status, response) ->
    $form = $('#paymentForm')

    $form.find('.on-form-error-messages').empty()

    if (response.error)
      html = "<li>" + response.error.message + "</li>"
      $form.find('.on-form-error-messages').append html
      $form.find('button').prop 'disabled', false
      window.scrollTo(0,0)
    else
      html = '<input type="hidden" name="membership_registration_form[card_token]" />'
      $form.append($(html).val(response.id))
      $form.get(0).submit()

  submit = (e) ->
    $form = $(this)

    $form.find('button').prop 'disabled', true

    Stripe.setPublishableKey $('#paymentForm').data('stripe-publishable-key')
    Stripe.card.createToken $form, stripe_response_handler

    false

  $('#paymentForm').submit submit

$(document).on 'ready page:load', membership_new_on_ready
