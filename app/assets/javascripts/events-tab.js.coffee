events_tab_show = ->
  $('#events-tab a').click (e) ->
    e.preventDefault()
    $(this).tab('show')

$(document).on 'ready page:load', events_tab_show
