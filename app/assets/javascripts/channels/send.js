$(document).on("keypress", "#channel-chat-form", "[data-behavior~=chat_speaker]", function(event){
  if ( event.key == 'Enter' ) {
    App.chat.speak(event.target.value);
    event.target.value = ''
    event.preventDefault();

    scrollMessage();
    console.log("keypress実行");
  }
});

$(document).on("submit", "#channel-chat-form", function(event){
  var value = $('[data-behavior~=chat_speaker]').val()
  App.chat.speak(value);
  $('[data-behavior~=chat_speaker]').val('')
  event.preventDefault();

  scrollMessage();
  console.log("submit実行");
});
