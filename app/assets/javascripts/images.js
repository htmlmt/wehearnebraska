$(document).ready(function() {
    var photoInterval = setInterval(changePhoto, 8000);
    var photoPositionArray = [0, 25, 50, 75, 100];
    var photoCredits = ["photo of <a href=\"http://hearnebraska.org/feature/avett-brothers-pershing-center-photo-slideshow/\" target=\"_blank\">The Avett Brothers</a> by Matthew Masin", "photo of <a href=\"http://hearnebraska.org/feature/sleater-kinney-slowdown-photos-review/\" target=\"_blank\">Sleater-Kinney</a> by Chris Dinan", "photo of <a href=\"http://hearnebraska.org/feature/shabazz-palaces-spencelove-vega-concert-review-photos/\" target=\"_blank\">Shabazz Palaces</a> by Chris Dinan", "photo of <a href=\"http://hearnebraska.org/feature/menzingers-flatliners-broadway-calls-photo-essay/\" target=\"_blank\">The Menzingers</a> by Andrew Norman", "photo of <a href=\"http://hearnebraska.org/feature/skrillex-streets-photo-review/\" target=\"_blank\">Skrillex</a> by Will Stott"]
    var photoIndex = 1;
    function changePhoto() {
        $('.container--header').css('background-position', '' + photoPositionArray[photoIndex] + '% 0%');
        $('.login-status--credit').html("<em>" + photoCredits[photoIndex] + "</em>");
        if (photoIndex < 4) {
            photoIndex++
        } else {
            abortTimer();
        }
    }
    function abortTimer() {
        clearInterval(photoInterval);
    }
});