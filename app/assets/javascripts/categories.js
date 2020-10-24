// 親セレクタを変更したら子要素が発火
$('#parent_category').change(function() {
  // 選択した親要素の値を取得
  const parentValue = $('#parent_category').val();
  // 初期値（"選択してください")以外が選択されたらajaxを開始
  if (parentValue.length !== "") {
    $.ajax( {
      type: 'GET',
      url: '',
      // サーバーに送信する値
      data: { parent_id: parentValue },
      // サーバーから返されるデータの型を指定
      dataType: 'json'
    });
    // 非同期通信が成功した時(dataにはリクエストによって返ってきたレスポンスが代入される。)
    .done(function(data) {

    });
    // 非同期通信が失敗した時
    .fail(function() {

    });
  }
});