# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#link_register').click ->
    $('#twitter-icon').animate
      zIndex: 1,
      {
        duration: 5000
        step: (now) ->
          $(this).css( transform: 'rotate(' + (now * 1080) + 'deg)' )
        complete: ->
          $('#twitter-icon').css('zIndex', 0)
      }