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
    console.log(target_image);
    // removeメソッドでプレビュー画像を削除
    $(this).parent().remove();
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
      // 画像の読み込みが完了したらプレビュー表示
      const tagert_index = $('.js-file').length - 2
      console.log(tagert_index)
     
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
