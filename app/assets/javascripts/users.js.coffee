# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    console.log("data(id): " + $(this).data('id'))
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    console.log("regexp: " + regexp )
    $(this).before($(this).data('fields').replace(regexp, time))
    console.log("data(fields): " + $(this).data('fields'))
    console.log("data(fields).replace: " + $(this).data('fields').replace(regexp, time))
    event.preventDefault()