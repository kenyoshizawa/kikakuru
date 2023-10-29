$(document).on("click", '.ajax-attendance-this-event', function() {
  var eventUrl = $(this).data("event-url");

  $.ajax({
    type: 'PATCH',
    url: '/user_events/' +  eventUrl,
    data: {
      user_event: {
        attendance: "attendance"
      }
    }
  })
  .then(
    function (data) {
      console.log("ajax成功");

      var current_user_id = data.current_user_id
      console.log("#event-member-" + current_user_id);
      $("#event-member-" + current_user_id).removeClass("bg-success");
      $("#event-member-" + current_user_id).addClass("bg-primary");
      $("#event-member-" + current_user_id).html("出席");
      $("#check-attendance-button").remove();
    },
    function (XMLHttpRequest, textStatus, errorThrown) {
      alert("読み込み失敗");
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
  });
})

$(document).on("click", '.ajax-absence-this-event', function() {
  var eventUrl = $(this).data("event-url");

  $.ajax({
    type: 'PATCH',
    url: '/user_events/' +  eventUrl,
    data: {
      user_event: {
        attendance: "absence"
      }
    }
  })
  .then(function (data) {
    console.log("ajax成功");

    var current_user_id = data.current_user_id
    console.log("#event-member-" + current_user_id);
    $("#event-member-" + current_user_id).removeClass("bg-success");
    $("#event-member-" + current_user_id).addClass("bg-danger");
    $("#event-member-" + current_user_id).html("欠席");
    $("#check-attendance-button").remove();
  })
})
