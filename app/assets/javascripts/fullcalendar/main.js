var select_date = [];

$(function() {
  $('#calendar').fullCalendar({
    dayClick: function(date) {
      // クリックした日付を"YYYY-MM-DD"形式で変数に代入
      var datetime = moment(date).format("YYYY-MM-DD");

      // もし配列の中に同じ値が存在しない場合select_date.indexOf(datetime)は-1を返す
      if ( select_date.indexOf(datetime) === -1 ) {
        select_date.push(datetime); // 配列にクリックした日付を追加する（日付の重複なし）
      } else {
        var double_date = select_date.indexOf(datetime)
        select_date.splice(double_date, 1); // 重複する値のkeyの位置から1番目を削除（日付の重複あり）
      }

      console.log(select_date);
      // inputのhiddenへ変数をpost
      $("#event_schedules_date").val(select_date);
    }
  });
});
