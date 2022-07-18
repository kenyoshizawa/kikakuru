App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    return console.log("success to connect!")
    // Called when the subscription is ready for use on the server
  },
  disconnected: function() {
    return console.log("disconnect!")
    // Called when the subscription has been terminated by the server
  },
  received: function(data) {
    return $('#channel-all-messages').append(data['message']);
  },
  speak: function(message) {
    console.log(message)
    return this.perform('speak', { message: message });
  }
});
