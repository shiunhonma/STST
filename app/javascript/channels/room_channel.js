import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    return this.perform("room_select", { room: $('#chats').data('room_id')});
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    return $('#chats').append(data['message']);
  },

  speak: function(message, user_id, room_id) {
    return this.perform("speak", { message: message, user: user_id, room: room_id});
  }
});

$("#chat_input").keypress(function(e) {
  if (e.keyCode === 13) {
    appRoom.speak(e.target.value, $("#current_user").data("user_id"),$("#chats").data("room_id"));
    e.target.value = "";
    e.preventDefault();
  }
});