window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/comments', (payload) ->
    $('div#microposts_<%= @micropost.id %>.micropost').prepend(payload.message) if payload.message