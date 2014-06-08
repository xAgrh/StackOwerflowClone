# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->


#  $('form.new_comment').bind 'ajax:success', (e, data, status, xhr) ->
#    comment = $.parseJSON(xhr.responseText)
#    if (comment.commentable_type == "Question") 
#      $('.comments').append('<p>' + comment.body + '</p>')
#    if (comment.commentable_type == "Answer")
#      $('#answer-' + comment.commentable_id + ' .comments_in_answer').append('<p>' + comment.body + '</p>')
#  .bind 'ajax:error', (e, xhr, status, error) ->
#    errors = $.parseJSON(xhr.responceText)
#    $.each errors, (index, value) ->
#      $('.comment-errors').append(value)

  questionId = $('.comments').data('questionId')
  PrivatePub.subscribe '/questions/' + questionId + '/comments', (data, channel) ->
    comment = $.parseJSON(data['comment'])
    $('.comments').append('<p>' + comment.body + '</p>')
    
    

  PrivatePub.subscribe '/questions/' + questionId + '/answers/comments', (data, channel) ->
    comment = $.parseJSON(data['comment'])
    $('#answer-' + comment.commentable_id + ' .comments_in_answer').append('<p>' + comment.body + '</p>')
    