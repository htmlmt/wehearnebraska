$(document).ready(function() {
    var photoInterval = setInterval(changePhoto, 8000);
    var photoPositionArray = [0, 25, 50, 75, 100];
    var photoCredits = ["photo of The Avett Brothers by Matthew Masin", "photo of Sleater-Kinney by Chris Dinan", "photo of Shabazz Palaces by Chris Dinan", "photo of The Menzingers by Andrew Norman", "photo of Skrillex by Will Stott"]
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