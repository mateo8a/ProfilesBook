# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

status_options = ->
    $('.status').mouseover (event) ->
        console.log("Hover triggered")
        $(this).addClass("hover")
    $('.status').mouseout (event) ->
        console.log("Hover triggered")
        $(this).removeClass("hover")

$(document).on('turbolinks:load', status_options)