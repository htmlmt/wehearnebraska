$(document).ready(function() {
  var inp = document.getElementById('myinput');
  var chars = document.getElementById('chars');
  inp.onkeyup = function() {
    chars.innerHTML = (67 - inp.value.length);
  }
  
  window.onload = function() {
    var url = RegExp('(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}')
    var replacement = document.body.innerHTML.replace(url, "");
    document.body.innerHTML = replacement
    
    var finalReplacement = document.body.innerHTML.replace(/ Spread the word: . #WeHearNebraska/g, "");
    document.body.innerHTML = finalReplacement
  }
  
  $('#submit').on("click", function () {
    $('input[name="tweet[message]"]').map(function () {
      $(this).val($(this).attr('title') + $(this).val() + $(this).attr('tag'));
      $(this).hide();
    });
  });
});