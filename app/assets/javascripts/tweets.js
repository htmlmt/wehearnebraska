$(document).ready(function() {
    document.onkeydown = function() {
        var band = document.getElementById('tweet_band');
        var message = document.getElementById('tweet_message');
        var chars = document.getElementsByClassName('question--characters-left')[0];
        var total = 92;
        band.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
        message.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
    }
  
    removeCanned();
    removeOtherCanned();
    removeAnotherCanned();
    removeYetAnotherCanned();
  
    $('.tweet_out').click(function () {
        $('input[name="tweet[message]"]').map(function () {
            $(this).val($(this).val() + $(this).attr('tag'));
        });
    });
});