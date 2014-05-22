on_form_error = ->
  if ($(".errors")[0])
    $(".focus-on-error").focus()
    $(".has-error-group").addClass("has-error")

$(document).on 'ready page:load', on_form_error
