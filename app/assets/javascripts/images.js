$(document).ready(function() {
    var photoInterval = setInterval(changePhoto, 4000);
    var photoPositionArray = [0, 25, 50, 75, 100]
    var photoIndex = 1;
    function changePhoto() {
        $('.container--header').css('background-position', '' + photoPositionArray[photoIndex] + '% 0%')
        if (photoIndex <= 4) {
            photoIndex++
        } else {
            photoIndex = 1;
        }
    }
});