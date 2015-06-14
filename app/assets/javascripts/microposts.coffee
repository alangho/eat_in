window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/microposts', (payload) ->
    $('.microposts').prepend(payload.message) if payload.message