document.addEventListener(
  "DOMContentLoaded", e => {
    //token_submitというidがnullの場合、下記コードを実行しない
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey("pk_test_a634a10dfdcba3782d23794b");
      let btn = document.getElementById("token_submit");
      btn.addEventListener('click', e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; // 入力されたデータを取得
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            // 成功した場合
            $('#card_bumber').removeAttr("name");
            $('#cvc').removeAttr("name");
            $('#exp_month').removeAttr("name");
            $('#exp_year').removeAttr("name"); // 自分のサーバにpostしないように削除
            $('#card_token').append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にする
            $('#card_form').get(0).submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません");
          }
        });
      });
    }
  },
  false
);