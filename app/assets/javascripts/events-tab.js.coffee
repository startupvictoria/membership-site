events_tab_setup = ->
  $('.selectpicker').selectpicker()
  $('.selectpicker').selectpicker 'val', event_organizer_default()

  $('.selectpicker').change (e) ->
    events_filter_by_organizer $(this).val()

  $('#events-tab > li > a').click (e) ->
    e.preventDefault()
    $(this).tab 'show'

events_filter_by_organizer = (organizer_name) ->
  is_show_all = organizer_name == event_organizer_default()

  $('.event-list-item').each ->
    if is_show_all || (organizer_name == $(this).attr('data-event-organizer'))
      $(this).show()
    else
      $(this).hide()

event_organizer_default = ->
  $('.selectpicker').attr 'data-default-option'

$(document).ready events_tab_setup
$(document).on 'page:load', events_tab_setup
