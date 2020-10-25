$(function() {
  // 子のselectタグを追加
  function build_childHTML() {
    let child_field = `<select class="ListingMain__entire__menu__form__list__input__child"
                          id="item_category_id" name=item[category_id]>
                          <option value="">選択してください</option>
                        </select>
                      `
    return child_field;
  };

  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html = `
                        <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  };

  // 孫のselectタグを追加
  function build_grandchildHTML() {
    let grandchild_field = `<select class="ListingMain__entire__menu__form__list__input"
                              id="item_category_id" name=item[category_id]>
                              <option value="">選択してください</option>
                            </select>
                          `
    return grandchild_field;
  };

  // 親セレクタを変更したら子要素が発火
  $('#parent_category').change(function() {
    // 選択した親要素の値を取得
    const parentValue = $('#parent_category').val();
    // 初期値（"選択してください")以外が選択されたらajaxを開始
    if (parentValue.length !== "") {
      $.ajax( {
        type: 'GET',
        url: '/items/category',
        // サーバーに送信する値
        data: { parent_id: parentValue },
        // サーバーから返されるデータの型を指定
        dataType: 'json'
      })
      // 非同期通信が成功した時(dataにはリクエストによって返ってきたレスポンスが代入される。)
      .done(function(data) {
        // selectタグを生成してビューにappendする
        let child_field = build_childHTML
        $('#parent_box').append(child_field);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする(forEachメソッドは与えられた関数を配列に含まれる各要素に対して一度ずつ呼び出す)
        data.forEach(function(e) {
          let option_html = build_Option(e)
          $(".ListingMain__entire__menu__form__list__input__child").append(option_html);
        });
      })
      // 非同期通信が失敗した時
      .fail(function() {
        alert("子カテゴリーでエラーです");
      });
    };
  });

  // 子セレクタを変更したら孫要素が発火
  $(document).on('change', '.ListingMain__entire__menu__form__list__input__child', function() {
    // 選択した子カテゴリーの値を取得する
    let childValue = $('.ListingMain__entire__menu__form__list__input__child').val();
    // 初期値（"選択してください")以外が選択されたらajaxを開始
    if (childValue.length !== "") {
      $.ajax( {
        type: 'GET',
        url: '/items/category',
        // サーバーに送信する値
        data: { children_id: childValue },
        // サーバーから返されるデータの型を指定
        dataType: 'json'
      })
      // 非同期通信が成功した時(dataにはリクエストによって返ってきたレスポンスが代入される。)
      .done(function(grandchild_data) {
        // selectタグを生成してビューにappendする
        let grandchild_field = build_grandchildHTML
        $('#parent_box').append(grandchild_field);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        grandchild_data.forEach(function (grandchild_e) {
          let option_html = build_Option(grandchild_e);
          $(".ListingMain__entire__menu__form__list__input__child").append(option_html);
        });
      })
      .fail(function() {
        alert("孫カテゴリーでエラーです")
      })
    }
  });
});