$(document).ready(function() {
    document.onkeydown = function() {
        var band = document.getElementById('tweet_band');
        var message = document.getElementById('tweet_message');
        var chars = document.getElementsByClassName('question--characters-left')[0];
        var total = 76;
        band.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
        message.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
    }
  
    $('#submit').click(function () {
        $('input[name="tweet[band]"]').map(function () {
            $(this).val('.' + $(this).val());
        });
        
        $('input[name="tweet[message]"]').map(function () {
            $(this).val('Play a Nebraska show because ' + $(this).val() + $(this).attr('tag'));
        });
    });
});