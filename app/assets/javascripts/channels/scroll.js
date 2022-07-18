$(document).ready(function(){
  scrollMessage();
});


function scrollMessage() {
  var position = $('#channel-all-messages').height();
  var speed = 200;

  $('#chat-area').animate({ scrollTop: position }, speed);
  //
  // var element = document.getElementById("channel-all-messages");
  //
  // element.scrollIntoView({
  //   behavior : 'instant',
  //   block    : 'end'
  // });

  // var allmessages = $('#channel-all-messages').outerHeight(true);
  // var scrollbox = $('#chat-area').height();
  // $('#chat-area').scrollTop(allmessages - scrollbox);

  // console.log("#channel-all-messagesの要素のmargin、border、paddingを含んだ高さ = " + allmessages);
  // console.log("#chat-areaの要素の高さのみ = " + scrollbox);
  // console.log(allmessages - scrollbox);
  // console.log("scrollMessage関数")
}
