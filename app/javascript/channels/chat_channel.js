import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  
  received(data) {
    const messages = document.querySelector('#messages')
    messages.insertAdjacentHTML('beforeend', `<p>${data.message}</p>`)
  },

  speak: function(message) {
    return this.perform('speak', { message: message });
  }
});
