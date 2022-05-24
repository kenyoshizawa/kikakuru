$(function() {
  $('#flatpickr').flatpickr({
    // 時間の指定を有効
    enableTime: true,
    // https://tr.you84815.space/flatpickr/formattingTokens.html
    // 日付のフォーマット
    // Y:年の数字。4桁。	1999 や 2003等
    // n:月の数字。0をつけません。1 ～ 12
    // j;日付の数字。0をつけません。1 ～ 31
    // D:日付の曜日。Mon ～ Sun
    // H:時(24時間)	00 ～ 23
    // i:分00 ～ 59
    dateFormat: "Y年n月j日（D） H:i",
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
    // 初期日時の「時間」を指定します。
    defaultHour: 12,
    // 特定日付以外を無効化
    enable: [
      {
        from: 'today',
        to: new Date('2023-01-01')
      }
    ],
  });
});