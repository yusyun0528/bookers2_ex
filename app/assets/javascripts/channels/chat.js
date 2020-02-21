$(document).on("turbolinks:load", function(){
  App.chat = App.cable.subscriptions.create({channel: 'ChatChannel', room_id: $('#room').data('room') }, {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
  
    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      if(data["chat"]["user_id"] == $('#room').data('user')){
        $('#messages').append('<p class="message--mine">'+ data["chat"]["body"] +'</p>')
      } else {
        $('#messages').append('<p class="message--yours">'+ data["chat"]["body"] +'</p>')
      }
    }
  });  

  $("#chat__input").on('keypress', function(e) {
    if (e.keyCode === 13) {
      App.chat.perform("create", {data: $(e.target).val(), current_user_id: $('#room').data('user')});
      $(e.target).val('');
      e.preventDefault();
    }
  })
})