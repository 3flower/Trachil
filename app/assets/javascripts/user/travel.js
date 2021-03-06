$(document).on('turbolinks:load', function(){
  $(function(){

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">\
                    <div class="upper-box">\
                      <img src="" alt="preview">\
                    </div>\
                    <div class="lower-box">\
                      <div class="delete-box" id="delete_btn_${count}">\
                        <span>削除</span>\
                      </div>\
                    </div>\
                  </div>`
      return html;
    }

    // 投稿編集時
    //travels/:i/editページへリンクした際のアクション=======================================
    if (window.location.href.match(/\/travels\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      labelWidth = (900 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      //プレビューにidを追加
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      //プレビューが5あるときは、投稿ボックスを消しておく
      if (count == 5) {
        $('.label-content').hide();
      }
    }
    // renderで戻ってきた時の処理
    var prevContent = $('.label-content').prev();
    labelWidth = (900 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    if ($('.preview-box').length == 5) {
      $('.label-content').hide();
    }
    //=============================================================================

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.label-content').prev();
      labelWidth = (900 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(".hidden-field").each(function(i, o){
      if ($(o).hasClass("added") == false && $(o).val() == ""){
        var id = $(o).attr('id').replace(/[^0-9]/g, '');
        $('.label-box').attr({id: `label-box--${id}`,for: `travel_images_attributes_${id}_image`});
        return false;
      }
      });

      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す
        if (count == 5) {
          $('.label-content').hide();
        }

        //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す=============
        if ($(`#travel_travel_images_attributes_${id}__destroy`)){
          $(`#travel_travel_images_attributes_${id}__destroy`).prop('checked',false);
        }
        //=============================================================================

        //ラベルのwidth操作
        setLabel();
        // サブミットボタンを押せるようにする
        if ($('.preview-content').find('.preview-box').length && $('#travel_category_attributes_is_play').prop('checked') || $('#travel_category_attributes_is_hotel').prop('checked') || $('#travel_category_attributes_is_meal').prop('checked')) {
          $('#travel-submit').removeAttr('disabled');
        } else {
          $('#travel-submit').attr('disabled', 'disabled');
        }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      // サブミットボタンを押せなくする
      if ($('.preview-content').find('.preview-box').length && $('#travel_category_attributes_is_play').prop('checked') || $('#travel_category_attributes_is_hotel').prop('checked') || $('#travel_category_attributes_is_meal').prop('checked')) {
        $('#travel-submit').removeAttr('disabled');
      } else {
        $('#travel-submit').attr('disabled', 'disabled');
      }

      //新規登録時と編集時の場合分け==========================================================

      //新規投稿時
      //削除用チェックボックスの有無で判定
      if ($(`#travel_travel_images_attributes_${id}__destroy`).length == 0) {
        //フォームの中身を削除
        $(`#travel_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `travel_images_attributes_${id}_image`});
        }
      } else {

        //投稿編集時
        $(`#travel_travel_images_attributes_${id}__destroy`).prop('checked',true);
        //フォームの中身を削除
        $(`#travel_images_attributes_${id}_image`).val("");
        // 元々画像があるのにクラスを削除する
        $(`#travel_images_attributes_${id}_image`).removeClass("added");
        //5個めが消されたらラベルを表示
        if (count == 5) {
          $('.label-content').show();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `travel_images_attributes_${id}_image`});
        }
      }
      //=============================================================================
    });
  });
});
