$(document).ready(function() {
  
  $('#submit').click(function () {
    $('input[name="tweet[message]"]').map(function () {
      $(this).val($(this).attr('title') + $(this).val() + $(this).attr('tag'));
      $(this).hide();
    });
  });
});