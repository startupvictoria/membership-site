navbar_set_active_class = ->
  $(".navbar-set-active li a").each ->
    if (window.location.pathname == $(this).attr("href"))
      $(".navbar-set-active li").removeClass "active"
      $(this).parent().addClass "active"
      return false

$(document).on 'ready page:load', navbar_set_active_class
