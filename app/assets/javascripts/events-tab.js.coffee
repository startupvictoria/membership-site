events_tab_show = ->
  $('#events-tab a').click (e) ->
    e.preventDefault()
    $(this).tab('show')

$(document).ready(events_tab_show)
$(document).on 'page:load', events_tab_show
