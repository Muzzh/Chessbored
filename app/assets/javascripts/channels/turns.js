// app/assets/javascripts/channels/turns.js

App.messages = App.cable.subscriptions.create('TurnsChannel', {  
  received: function(data) {
    var abc = $('.board').data('game-id');
    var windowUserId = $('.board').data('user-id');
    if(data.refresh == true && data.game_id == abc) {
      if(data.user_played_id == windowUserId) {
        location.replace('../');
      } else {
        location.reload(true);
      }
      $( document ).on('turbolinks:load', function() {
        alert: data.pop_up;
      });
    }
  }
});