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
  })

   // 新規会員登録の画像プレビューと削除
   // var file_field = document.querySelector('input[type=file]')
  $('#user_image').change(function(){
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onload= function() {
      document.getElementById('preview').src = fileReader.result;
    }
    fileReader.readAsDataURL(file);
    $('.icon_remove').fadeIn();
    $('.icon_remove').click(function(){
      // $('#preview').remove();
      $('.icon_remove').css('display', 'none');
      //inputタグに入ったファイルを削除
      $('#user_image').val("");
    });
  });
});
