$(document).ready(function() {
    document.onkeydown = function() {
        var band = document.getElementById('tweet_band');
        var message = document.getElementById('tweet_message');
        var chars = document.getElementsByClassName('question--characters-left')[0];
        var total = 79;
        band.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
        message.onkeyup = function() {
            chars.innerHTML = (total - band.value.length - message.value.length);
        }
    }
});