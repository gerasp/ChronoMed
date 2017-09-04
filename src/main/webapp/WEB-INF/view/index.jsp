

<%@include file="header.jsp" %>

<body>
<div class="cover" id="intro">
    <div class="background-image-fixed cover-image" style="background-image : url('<c:url value="/static/images/cover.jpeg"/>')"></div>
    <div class="container">
        <div class="row form">
            <div class="col-md-5 logo">
                <img src="<c:url value="/static/images/ChronoMed.png"/>" class="center-block img-responsive logo">
            </div>
            <div class="col-md-7 signin-form">
                <ul class="nav nav-justified nav-tabs">
                    <li class="active">
                        <a href="#"><i class="fa  fa-lg fa-user"></i>&nbsp;<fmt:message key="index.login"/><br></a>
                    </li>
                    <li></li>
                </ul>
                <form:form action="login" modelAttribute="user" cssClass="form-horizontal text-right signin-container">
                    <div class="container">
                        <div class="row">
                            <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <fmt:message key="form.email" var="emailPlaceholder"/>
                                        <form:input path="email" cssClass="form-control" placeholder="${emailPlaceholder}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                        <fmt:message key="form.password" var="passwordPlaceholder"/>
                                        <form:password path="password" cssClass="form-control" placeholder="${passwordPlaceholder}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <form:button class="btn btn-lg btn-primary">
                                        <i class="fa fa-2x fa-sign-in"></i><br><fmt:message key="form.login"/>
                                    </form:button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<div class="section" id="services">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1><fmt:message key="index.services.title"/></h1>
            </div>
        </div>
    </div>
</div>
<div class="section section-primary services">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img src="<c:url value="/static/images/patient.jpeg"/>" class="center-block img-responsive">
                <h2 class="text-center"><fmt:message key="index.services.patient.title"/></h2>
                <p class="text-center"><fmt:message key="index.services.patient.content"/></p>
            </div>
            <div class="col-md-4">
                <img src="<c:url value="/static/images/doctor.jpg"/>" class="center-block img-responsive">
                <h2 class="text-center"><fmt:message key="index.services.doctor.title"/></h2>
                <p class="text-center"><fmt:message key="index.services.doctor.content"/></p>
            </div>
            <div class="col-md-4">
                <img src="<c:url value="/static/images/admin.jpg"/>" class="center-block img-responsive">
                <h2 class="text-center"><fmt:message key="index.services.admin.title"/></h2>
                <p class="text-center"><fmt:message key="index.services.admin.content"/></p>
            </div>
        </div>
    </div>
</div>
<div class="section" id="team">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left"><fmt:message key="index.team.title"/></h1>
                <p class="lead text-left"><fmt:message key="index.team.subtitle"/></p>
            </div>
        </div>
        <div class="row team-row">
            <div class="col-sm-2">
                <img src="<c:url value="/static/images/team/al.jpg"/>" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left"><fmt:message key="index.team.developer.1"/></h3>
                <p class="lead text-left"><fmt:message key="index.team.developer"/></p>
            </div>
            <div class="col-sm-2">
                <img class="img-circle img-responsive" src="<c:url value="/static/images/team/gm.jpeg"/>">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left font-bold"><fmt:message key="index.team.developer.2"/></h3>
                <p class="lead text-left"><fmt:message key="index.team.developer"/></p>
            </div>
        </div>
        <div class="row team-row">
            <div class="col-sm-2">
                <img src="<c:url value="/static/images/team/ss.jpg"/>" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left"><fmt:message key="index.team.developer.3"/></h3>
                <p class="lead text-left"><fmt:message key="index.team.developer"/></p>
            </div>
            <div class="col-sm-2">
                <img src="<c:url value="/static/images/team/og.jpg"/>" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4 text-center">
                <h3 class="text-left"><fmt:message key="index.team.developer.4"/></h3>
                <p class="lead text-left"><fmt:message key="index.team.developer"/></p>
            </div>
        </div>
        <div class="row team-row">
            <div class="col-sm-2">
                <img src="<c:url value="/static/images/team/jd.png"/>" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left"><fmt:message key="index.team.developer.5"/></h3>
                <p class="lead text-left"><fmt:message key="index.team.developer"/></p>
            </div>
            <div class="col-sm-2">
                <img src="<c:url value="/static/images/team/gc.jpg"/>" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4 text-center">
                <h3 class="text-left"><fmt:message key="index.team.developer.6"/></h3>
                <p class="lead text-left"><fmt:message key="index.team.developer"/></p>
            </div>
        </div>
    </div>
</div>
<div class="section section-primary" id="contact">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-left">
                <h1><fmt:message key="index.contact.title"/></h1>
                <p><fmt:message key="index.contact.content"/></p>
            </div>
            <div class="col-md-6">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3520.4013483806557!2d-15.453591885445855!3d28.07329808264172!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xc40942fde2813a9%3A0x8b61a40c00405a46!2sUniversidad+de+Las+Palmas+de+Gran+Canaria%3A+Escuela+de+Ingenier%C3%ADa+Inform%C3%A1tica!5e0!3m2!1sde!2ses!4v1487770546552"
                        width="600" height="450" frameborder="0" style="border:0" allowfullscreen=""
                        class="img-responsive"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="contact section">
    <div class="container">
        <div class="row text-center">
            <div class="col-xs-3 text-center"><a><i class="fa fa-5x fa-instagram"></i></a></div>
            <div class="col-xs-3"><a><i class="fa fa-5x fa-twitter"></i></a></div>
            <div class="col-xs-3"><a><i class="fa fa-5x fa-facebook"></i></a></div>
            <div class="col-xs-3 text-center"><a href="http://github.com/gerasp/ChronoMed"><i
                    class="fa fa-5x fa-github"></i></a></div>
        </div>
    </div>
</div>
<script>
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
</script>
</body>

</html>
<%--<% } %>--%>