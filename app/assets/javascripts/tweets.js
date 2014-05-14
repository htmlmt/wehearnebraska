$(document).ready(function() {
  var inp = document.getElementById('myinput');
  var chars = document.getElementById('chars');
  inp.onkeyup = function() {
    chars.innerHTML = (67 - inp.value.length);
  }
  
  $('#submit').click(function () {
    $('input[name="tweet[message]"]').map(function () {
      $(this).val($(this).attr('title') + $(this).val() + $(this).attr('tag'));
      $(this).hide();
    });
  });
});