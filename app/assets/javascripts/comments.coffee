window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/comments', (payload) ->
    $('div#micropost_<%= @comment.micropost.id %>.micropost').prepend(payload.message) if payload.message