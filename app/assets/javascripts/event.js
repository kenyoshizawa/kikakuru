$(function() {
  // urlコピー
  $("#copy-url").on("click", function(){
    // span 要素の内容を選択状態にする
    const selection = document.getSelection();
    const range = document.createRange();
    const copyTarget = document.getElementById('copyTarget');
    range.setStart(copyTarget, 0);
    range.setEnd(copyTarget, copyTarget.childNodes.length);
    selection.addRange(range);

    // 選択状態のテキストをコピーする
    document.execCommand('copy');
    window.alert('クリップボードにコピーしました。');
  });
});
