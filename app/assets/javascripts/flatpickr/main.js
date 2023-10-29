$(function() {
  $('#flatpickr').flatpickr({
    // 時間の指定を有効
    enableTime: true,
    // 表示用日付の表示を許可
    altInput: true,
    // 表示用日付
    altFormat: "Y年n月j日（D） H:i",
    // 日付フォーマット
    dateFormat: "Y-m-d H:i",
    // 24時間表記にする
    time_24hr: true,
    // 日付の初期値設定
    defaultDate: 'today',
    // 分入力の間隔
    minuteIncrement: 10,
    // 言語設定
    locale: "ja",
    // モバイルでネイティブの日時ウィジェットを使わないかどうかを設定
    disableMobile: true,
    // カレンダーのヘッダーの月表示の方法
    monthSelectorType: 'static',
    // 特定日付以外を無効化
    enable: [
      {
        from: 'today',
        to: new Date('2024-01-01')
      }
    ],
  });
});
