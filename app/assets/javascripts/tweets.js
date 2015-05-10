$(document).ready(function() {
    document.onkeydown = function() {
        var band = document.getElementById('tweet_band');
        var message = document.getElementById('tweet_message');
        var chars = document.getElementsByClassName('question--characters-left')[0];
        var total = 99;
        band.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
        message.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
    }
  
    function removeCanned() {
        var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
        document.body.innerHTML = replacement

        var finalReplacement = document.body.innerHTML.replace(/ See info: . #TourNebraska/g, "");
        document.body.innerHTML = finalReplacement

        $("#submit").addClass("tweet_out")
    }
  
    function removeOtherCanned() {
        var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
        document.body.innerHTML = replacement

        var finalReplacement = document.body.innerHTML.replace(/ See info:  . #TourNebraska/g, "");
        document.body.innerHTML = finalReplacement

        $("#submit").addClass("tweet_out")
    }
  
    function removeAnotherCanned() {
        var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
        document.body.innerHTML = replacement

        var finalReplacement = document.body.innerHTML.replace(/ . #TourNebraska/g, "");
        document.body.innerHTML = finalReplacement

        $("#submit").addClass("tweet_out")
    }
  
    function removeYetAnotherCanned() {
        var replacement = document.body.innerHTML.replace(/(http:\/\/t.co\/)[a-zA-Z0-9\-\.]{10}/g, "");
        document.body.innerHTML = replacement

        var finalReplacement = document.body.innerHTML.replace(/ See info:  #TourNebraska/g, "");
        document.body.innerHTML = finalReplacement

        $("#submit").addClass("tweet_out")
    }
  
    removeCanned();
    removeOtherCanned();
    removeAnotherCanned();
    removeYetAnotherCanned();
  
    $('.tweet_out').click(function () {
        $('input[name="tweet[message]"]').map(function () {
            $(this).val($(this).val() + $(this).attr('tag'));
            $(this).hide();
            $('#chars').hide();
        });
    });
});