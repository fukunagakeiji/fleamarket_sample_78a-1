$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index-id="${index}" class="js-file_group">
                      <input class="js-file" type="file"
                      name="item[images_attributes][${index}][image]"
                      id="item_images_attributes_${index}_image"><br>
                      <div class="js-remove">削除</div>
                    </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.items-image').hide();

  // 複数枚画像を選択できるよう実装
  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る(.appendは要素内の末尾にタグを追加する)
    $('#image-box').append(buildFileField(fileIndex[0]));
    $('.ListingMain__entire__menu__list__field__display__content').attr('for', `item_images_attributes_${fileIndex[0]}_image`)
    // shift()メソッドは配列から最初の要素を削除して、その要素を返す。このメソッドは配列のlengthを変更する。
    fileIndex.shift();
    // 末尾の数に1足した数を追加する(.pushは配列の末尾に新しい要素を追加するためのメソッド)
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  // 画像の削除機能
  $('#image-box').on('click', '.js-remove', function() {
    // 画像のプレビュー要素を取得
    let target_image = $('.js-file_group').data("index-id");
    // 該当indexを振られているチェックボックスを取得
    let hiddenCheck = $(`input[data-index = "${target_image}"].items-image`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    // removeメソッドでプレビュー画像を削除
    $(this).parent().remove();
    $(`img[data-index = "${target_image}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  // 画像のプレビュー表示機能
  $(function() {
    // 画像ファイルプレビュー表示のイベント追加 file選択時に発火するイベントを登録
    $('#image-box').on('change', 'input[type="file"]', function(e) {
      // targetプロパティによりイベントが発生したDOM要素を取得
      let file = e.target.files[0];
      // FileReaderは選択した画像を読み込むためのオブジェクト
      let fileReader = new FileReader();
      // 画像ファイルのURLを取得
      fileReader.readAsDataURL(file);
      // 該当indexを持つimgタグがあれば取得して変数imgに入れる（画像変更の処理）
      if (img = $(`img[data-index = "${target_image}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else { // 新規画像追加の処理
        $('#previews').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1を足した数を追加
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      };
      // 画像の読み込みが完了したらプレビュー表示
      const tagert_index = $('.js-file').length - 2
      fileReader.onload = function(e) {
        $(`[data-index-id = "${tagert_index}"]`).append($('<img>').attr({
          src: e.target.result,
          width: "150px",
          class: "preview",
        }));
      };
    });
  });
});
