App.cookie_status = App.cable.subscriptions.create "CookieStatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#cooking-status').html data['message']
    # Called when there's incoming data on the websocket for this channel
