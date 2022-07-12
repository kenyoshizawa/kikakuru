App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    return console.log("success to connect!")
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    return $('#messages').append(data['message']);
  },
  speak: function(message) {
    return this.perform('speak', { message: message });
  }
});
