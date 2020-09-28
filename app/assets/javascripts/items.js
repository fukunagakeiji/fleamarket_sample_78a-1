$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group">
                    <input class="js-file" type="file"
                    name="items[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5];
  // id(image-box)を取得
  $('#image-box').on('change', '.js-file', function(e) {
    console.log("aiueo");
    // fileIndexの先頭の数字を使ってinputを作る(.appendは要素内の末尾にタグを追加する)
    $('#image-box').append(buildFileField(fileIndex[0]));
    $('.ListingMain__entire__menu__list__field__display__content').attr('for', `item_images_attributes_${fileIndex[0]}_image`)
    // shift()メソッドは配列から最初の要素を削除して、その要素を返す。このメソッドは配列のlengthを変更する。
    fileIndex.shift();
    // 末尾の数に1足した数を追加する(.pushは配列の末尾に新しい要素を追加するためのメソッド)
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  // $('#image-box').on('click', '.js-remove', function() {
  //   $(this).parent().remove();
  //   // 画像入力欄が0個にならないようにしておく
  //   if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  // });
});
