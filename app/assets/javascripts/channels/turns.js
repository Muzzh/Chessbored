// app/assets/javascripts/channels/turns.js

App.messages = App.cable.subscriptions.create('TurnsChannel', {  
  received: function(data) {
    var gameID = $('.board').data('game-id');
    var windowUserId = $('.board').data('user-id');
    if(data.refresh == true && data.game_id == gameID) {
      if(data.user_played_id == windowUserId) {
        if (data.error_pop_up != null) alert(data.error_pop_up);
      } else {
        if (data.turn_pop_up != null) alert(data.turn_pop_up)
      }
    }
    location.replace(data.game_path);
  }
});