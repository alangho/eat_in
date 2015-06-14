window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/comments', (payload) ->
    $('div#microposts_<%= dom_id(@micropost) %>.micropost').find('.media-list').prepend(payload.message) if payload.message