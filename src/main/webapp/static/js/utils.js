function filter() {
    var date = $("#from_date").val();
    var from = new Date((date === "") ? "01/01/1970" : date);
    date = $("#to_date").val();
    var to = date === "" ? new Date() : new Date(date);
    $(".timeline").children().each(function () {
        var actual = new Date($(this).find("time").attr("datetime"));
        if (from <= actual && actual <= to)
            $(this).show();
        else
            $(this).hide();
    });
}
function addHealthCard() {
    var healthcard = $("#inputHealthCard").val();
    if (healthcard === "")
        return;
    var html = "<li class='card-item'> <input value='" + healthcard + "'name='addedHealthCards' style='border:0; background:none;' readonly> <button type='button' onclick='deleteHealthCard(this)' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i>&nbsp;<fmt:message key='action.remove'/></button></li>";
    $("#healthCards").append(html);
}

function deleteHealthCard(button) {
    if (button.previousElementSibling.getAttribute("name") !== "addedHealthCards")
        button.previousElementSibling.setAttribute("name", "deletedHealthCards");
    else
        button.previousElementSibling.setAttribute("name", "trashHealthCardsList");
    button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
    button.remove();
}

function addDoctor() {
    var boardNumber = $("#inputDoctor").val();
    if (boardNumber === "")
        return;
    var html = "<li class='card-item'> <input value='" + boardNumber + "'name='addedBoardNumbers' style='border:0; background:none;' readonly> <button type='button' onclick='deleteDoctor(this)' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i>&nbsp;<fmt:message key='action.remove'/></button></li>";
    $("#doctorList").append(html);
}

function deleteDoctor(button) {
    if (button.previousElementSibling.getAttribute("name") !== "addedBoardNumbers")
        button.previousElementSibling.setAttribute("name", "deletedBoardNumbers");
    else
        button.previousElementSibling.setAttribute("name", "trashDoctor");
    button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
    button.remove();
}

function addHealthCardRegistration() {
    var healthcard = $("#inputHealthCard").val();
    if (healthcard === "")
        return;
    var html = "<li class='card-item'> <input value='" + healthcard + "' ame='healthCardsList' style='border:0; background:none;'><button onclick='this.parentNode.remove()' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i>&nbsp;<fmt:message key='action.remove'/></button></li>";
    $("#healthCards").append(html);
}

function deleteHealthCardRegistration(button) {
    button.parentNode.remove();
}

// LANGUAGE SELECTOR
$("#language-selector").click(function () {
    $("#language-selector-container").fadeOut("fast", function () {
        $("#language-menu").slideDown("slow", function () {
        });
    });
});

// OPEN FIRST PANEL
$(document).ready(function () {
    $('.panel-open-first').collapse("show");
});

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
