# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.map-link').click ->
    map_selector = this.id + "map"
    if $('#' + map_selector).is(':visible')
      $('#' + map_selector).hide()
    else
      $('#' + map_selector).show()

$(document).on('turbolinks:load', ready)
