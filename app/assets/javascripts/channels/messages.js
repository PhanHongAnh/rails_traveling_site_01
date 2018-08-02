$(document).ready(function() {
  chatroomId = $('input#message_chatroom_id').val();
  App.messages = App.cable.subscriptions.create({channel: 'MessagesChannel',
    chatroom_id: chatroomId}, {
    received: function(data) {
      $("#messages").removeClass('hidden')
      return $('#messages').append(this.renderMessage(data));
    },
    chatroom_id: function(data) {
      return data.chatroom_id
    },
    renderMessage: function(data) {
      $("#scroll").animate({ scrollTop: $("#scroll")[0].scrollHeight}, 1000);
      return "<div class='direct-chat-msg doted-border'><div class='direct-chat-info clearfix'><span class='direct-chat-name pull-left'>"
        + data.user
        + "</span></div><div class='direct-chat-text'>"
        + data.message +
        "</div><div class='direct-chat-info clearfix'><span class='direct-chat-timestamp pull-right'></span></div></div>";
    }
  });
})
