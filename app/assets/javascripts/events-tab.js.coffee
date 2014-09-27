events_tab_show = ->
  $('#events-tab > li > a').click (e) ->
    e.preventDefault()
    $(this).tab('show')

$(document).ready(events_tab_show)
$(document).on 'page:load', events_tab_show
