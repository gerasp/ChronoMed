// AFFIX EFFECT
$('#nav').affix({
    offset: {
        top: $('#intro').height() - 50
    }
}).find("a").on('click', function (event) {
    if (this.hash !== "") {
        event.preventDefault();
        var hash = this.hash;
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 800, function () {

            window.location.hash = hash;
        });
    }
});

// SCROLL SPY
$('body').scrollspy({target: ".navbar", offset: 50});


// HANDLE ANIMATION
$(window).on('scroll', function () {
    $(".animate").each(function () {
        var objectToAnimate = $(this);
        if ($(window).scrollTop() + $(window).height() * 0.5 > objectToAnimate.offset().top) {
            objectToAnimate.addClass("animated " + objectToAnimate.data('animation'));
        }
    });
});

$(document).ready(function () {
    $(window).scroll();
});