(function() {
  var membership_new_on_ready;

  membership_new_on_ready = function() {
    var stripe_response_handler, submit;
    stripe_response_handler = function(status, response) {
      var $form, html;
      $form = $('#paymentForm');
      $form.find('.on-form-error-messages').empty();
      if (response.error) {
        html = "<li>" + response.error.message + "</li>";
        $form.find('.on-form-error-messages').append(html);
        $form.find('button').prop('disabled', false);
        return window.scrollTo(0, 0);
      } else {
        html = '<input type="hidden" name="membership_registration_form[card_token]" />';
        $form.append($(html).val(response.id));
        return $form.get(0).submit();
      }
    };
    submit = function(e) {
      var $form;
      $form = $(this);
      $form.find('button').prop('disabled', true);
      Stripe.setPublishableKey($('#paymentForm').data('stripe-publishable-key'));
      Stripe.card.createToken($form, stripe_response_handler);
      return false;
    };
    return $('#paymentForm').submit(submit);
  };

  $(document).on('ready page:load', membership_new_on_ready);

}).call(this);
