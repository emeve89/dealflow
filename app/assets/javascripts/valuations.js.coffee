# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("input[type='checkbox']").on 'click', (e)->
    e.preventDefault
    id = 'quantity_for_' + @.id
    if @checked
      $("#"+id).prop('disabled', false)
    else
      $("#"+id).prop('disabled', true)

