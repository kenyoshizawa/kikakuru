$(document).on('keypress', '[data-behavior~=chat_speaker]', function(event){
  if ( event.key == 'Enter' ) {
    App.chat.speak(event.target.value);
    event.target.value = ''
    event.preventDefault();
  }
});
