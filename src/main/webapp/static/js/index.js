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
$('body').scrollspy({target: ".navbar", offset: 50});