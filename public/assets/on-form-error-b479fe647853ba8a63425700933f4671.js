(function() {
  var on_form_error;

  on_form_error = function() {
    if (($(".on-form-error-messages li")[0])) {
      $(".on-form-error-focus").focus();
      return $(".on-form-error-group").addClass("has-error");
    }
  };

  $(document).on('ready page:load', on_form_error);

}).call(this);
