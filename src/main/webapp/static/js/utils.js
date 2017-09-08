// LANGUAGE SELECTOR
$("#language-selector").click(function () {
    $("#language-selector-container").fadeOut("fast", function () {
        $("#language-menu").slideDown("slow", function () {
        });
    });
});

// OPEN FIRST PANEL
$(document).ready(function () {
    $('.panel-open-first').trigger("click");
});

// SIDEBAR SCROLL
var lastScrollTop = 0;
$(window).scroll(function (event) {
    // if ($(window).width() > 992) {
        var st = $(this).scrollTop();
        if (st > lastScrollTop) {
            var difference = st - lastScrollTop;
            $('.sidebar').animate({top: '+=' + difference}, difference);
        } else {
            var difference = lastScrollTop - st;
            $('.sidebar').animate({top: '-=' + difference}, difference);
        }
        lastScrollTop = st;
    // }
});

// HEALTHCARDS AND DOCTORS
$("#add-healthcard-button").click(function () {
    var hc = $("#add-healthcard-input").val();
    $("#add-healthcard-input").val("");
    $("#healthcard-list").append("<li class='card-item'><input value='"+hc+"' name='healthcards' readonly></li>");
});
$("#add-doctor-button").click(function () {
    var hc = $("#add-doctor-input").val();
    $("#add-doctor-input").val("");
    $("#doctor-list").append("<li class='card-item'><input value='"+hc+"' name='boardNumbers' readonly></li>");
});
$(".card-item > button").click(function () {
    $(this).parent().remove();
});