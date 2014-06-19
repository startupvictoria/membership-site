navbar_set_active_class = (parent_class) ->
  $(parent_class + " li a").each ->
    if (window.location.pathname == $(this).attr("href"))
      $(parent_class + " li").removeClass "active"
      $(this).parent().addClass "active"
      return false

navbar_set_active = ->
  navbar_set_active_class(".navbar-set-active")

$(document).on 'ready page:load', navbar_set_active
