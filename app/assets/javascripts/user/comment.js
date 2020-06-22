$(function() {
  $('#comment-submit').attr('disabled', 'disabled');

  $('#comment_travel_comment').bind('keydown keyup keypress change', function() {
    if ( $(this).val().length > 0 ) {
      $('#comment-submit').removeAttr('disabled');
    } else {
      $('#comment-submit').attr('disabled', 'disabled');
    }
  });
});
