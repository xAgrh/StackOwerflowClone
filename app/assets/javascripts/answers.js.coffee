# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.edit-answer-link').click (e) ->
    e.preventDefault();
    $(this).hide();
    answer_id = $(this).data('answerId')
    $('form#edit-answer-' + answer_id).show()


@cancelForm = () ->
  $('#answer_body').val('');

# HTML for answers
# $('form.new_answer').bind 'ajax:success', (e, data, status, xhr) ->
#   $('.answers').html(xhr.responseText)
# .bind 'ajax:error', (e, xhr, status, error) ->  
#   $('.answer-errors').html(xhr.responseText)

# JSON for answers

#  $('form.new_answer').bind 'ajax:success', (e, data, status, xhr) ->
#    answer = $.parseJSON(xhr.responseText)
#    $('.answers').append('<p>' + answer.body + </p>')

# .bind 'ajax:error', (e, xhr, status, error) ->
#   errors = $.parseJSON(xhr.responceText)
#   $.each errors, (index, value) ->
#     $('.answer-errors').append(value)