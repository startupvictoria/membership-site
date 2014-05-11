function startup_victoria_memberships_stripe_card_create_token(stripe_publishable_key)
{
  Stripe.setPublishableKey(stripe_publishable_key);

  var stripeResponseHandler = function(status, response) {
    var $form = $('#paymentForm');

    if (response.error) {
      $form.find('.paymentErrors').addClass('Form-errors').text(response.error.message);
      $form.find('button').prop('disabled', false);
      window.scrollTo(0,0);
    } else {
      var token = response.id;
      $form.append($('<input type="hidden" name="membership_registration_form[card_token]" />').val(token));
      $form.get(0).submit();
    }
  };

  jQuery(function($) {
    $('#paymentForm').submit(function(e) {
      var $form = $(this);

      $form.find('button').prop('disabled', true);

      Stripe.card.createToken($form, stripeResponseHandler);

      return false;
    });
  });
}
