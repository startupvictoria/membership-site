# This code works around turbolinks not reloading pages.
# Instead, turbolinks replaces the body of the page.
# This code listens for the turbolinks page:change event and notifies ga.
#
$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()
