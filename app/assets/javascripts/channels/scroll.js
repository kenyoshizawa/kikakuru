$(document).ready(function(){
  scrollMessage();
});


function scrollMessage() {
  var position = $('#channel-all-messages').height();
  var speed = 200;

  $('#chat-area').animate({ scrollTop: position }, speed);
}
