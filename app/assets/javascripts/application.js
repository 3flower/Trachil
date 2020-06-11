// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

$(function(){

  // ログインのモーダル表示
  $('#login-show').click(function(){
    $('#login-modal').fadeIn();
  });
  $('.close-modal').click(function(){
    $('#login-modal').fadeOut();
  })

  // 新規会員登録のラジオボタンのモーダル表示
  $('.is_child_true').click(function(){
    $('.is_child_show').fadeIn();
  });
  $('.is_child_false').click(function(){
    $('.is_child_show').fadeOut();
  });
  // 子供にいるのチェックが入っていたら表示する
  if($('#user_is_child_true').prop('checked')){
    $('.is_child_show').fadeIn();
  }
  // フラッシュメッセージを時間でフェイドアウトする
  setTimeout("$('#flash').fadeOut('slow')", 2000);

  // 新規会員登録の画像プレビューと削除
 $('#user_image').change(function(){
   var file = $('input[type="file"]').prop('files')[0];
   var fileReader = new FileReader();
   fileReader.onload= function() {
     document.getElementById('preview').src = fileReader.result;
   }
   fileReader.readAsDataURL(file);
   // $('#preview').fadeIn();
   // 画像が投稿されると削除ボタンが出てくる
   $('.icon_remove').fadeIn();
   $('.icon_remove').click(function(){
     // 画像を削除する
     $('#preview').removeAttr('src');
     // 削除ボタンを押すとデフォルトの画像に変わる
     $('#preview').attr({src: "/images/default.png"});
     $('.icon_remove').css('display', 'none');
     //inputタグに入ったファイルを削除
     $('#user_image').val("");
   });
 });

 // ユーザー詳細のタブメニュー
 $('#tab-contents .tab[id != "travel"]').hide();
  $('#tab-menu a').click(function() {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    return false;
  });

  // フォロー中のボタンの変更
  $('.follow-btn-chenge').mouseover(function(){
    $(this).val('フォローを解除');
    $(this).addClass('add_css_follow');
    $(this).mouseout(function(){
      $(this).val('フォロー中');
      $(this).removeClass('add_css_follow');
    });
  });

  // 新規投稿の駐車場ありの表示
  $('#travel_traffic_way option[value="車"]').prop('selected', true, function(){
    $('.parking-box').fadeIn();
  });
  $('#travel_traffic_way option[value="車"]').prop('selected', false, function(){
    $('.parking-box').fadeOut();
  })
  // var a = $('#travel_is_play"]').prop('selected')
  //   console.log( a );

  // 新規投稿のチェックの表示
  $('#travel_is_play').click(function(){
    if($('#travel_is_play').prop('selected', true)){
      $('.play-new').fadeIn();
    };
    if($('#travel_is_play').prop('selected', false)){
      $('.play-new').fadeOut();
    };
  });

  // $('.meal-new').fadeIn();
  // $('.hotel-new,').fadeIn();

});
