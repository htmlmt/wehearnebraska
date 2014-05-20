$(document).ready(function() {
  document.onkeydown = function() {
    var inp = document.getElementById('myinput');
    var chars = document.getElementById('chars');
    inp.onkeyup = function() {
      chars.innerHTML = (67 - inp.value.length);
    }
  }
  
  function removeCanned() {
    var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
    document.body.innerHTML = replacement
  
    var finalReplacement = document.body.innerHTML.replace(/ Spread the word: . #WeHearNebraska/g, "");
    document.body.innerHTML = finalReplacement
    
    $("#submit").addClass("tweet_out")
  }
  
  function removeOtherCanned() {
    var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
    document.body.innerHTML = replacement
  
    var finalReplacement = document.body.innerHTML.replace(/ Spread the word:  . #WeHearNebraska/g, "");
    document.body.innerHTML = finalReplacement
    
    $("#submit").addClass("tweet_out")
  }
  
  function removeAnotherCanned() {
    var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
    document.body.innerHTML = replacement
  
    var finalReplacement = document.body.innerHTML.replace(/ . #WeHearNebraska/g, "");
    document.body.innerHTML = finalReplacement
    
    $("#submit").addClass("tweet_out")
  }
  
  function removeYetAnotherCanned() {
    var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
    document.body.innerHTML = replacement
  
    var finalReplacement = document.body.innerHTML.replace(/ Spread the word:  #WeHearNebraska/g, "");
    document.body.innerHTML = finalReplacement
    
    $("#submit").addClass("tweet_out")
  }
  
  removeCanned();
  removeOtherCanned();
  removeAnotherCanned();
  removeYetAnotherCanned();
  
  $('.tweet_out').click(function () {
    $('input[name="tweet[message]"]').map(function () {
      $(this).val($(this).attr('title') + $(this).val() + $(this).attr('tag'));
      $(this).hide();
      $('#chars').hide();
    });
  });
  
});