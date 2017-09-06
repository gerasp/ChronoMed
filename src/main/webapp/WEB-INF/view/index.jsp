<%@include file="header.jsp" %>
<body>
<%@include file="index-intro.jsp" %>
<%@include file="index-services.jsp" %>
<%@include file="index-team.jsp" %>
<%@include file="index-contact.jsp" %>

<script>
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

</script>
</body>
</html>
