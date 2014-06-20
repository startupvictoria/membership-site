# workaround for
# https://github.com/rails/turbolinks/issues/365
#
$(document).on 'page:load', ->
  $('input[autofocus="autofocus"]').focus()
