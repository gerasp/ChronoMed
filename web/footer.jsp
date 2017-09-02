<% if (request.getSession().getAttribute("user") != null) { %>
<div class="section"></div>
<div class="bottom-navbar navbar navbar-default navbar-fixed-bottom navbar-inverse">
        <% } else { %>
    <div class="navbar navbar-inverse" id="nav" style="margin-top:-50px;">
        <% } %>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <% if (request.getSession().getAttribute("user") != null) { %>
                <a class="navbar-brand" href="/FrontController?command=LogoutCommand">
                    <i class="fa  fa-sign-out"></i>&nbsp;<fmt:message key="footer.logout"/>
                </a>
                <% } else { %>
                <a class="navbar-brand">@ ChronoMed 2017</a>
                <% } %>
            </div>
            <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                <ul class="nav navbar-nav" id="language-selector-container">
                    <li><a href="javascript:void(0)" id="language-selector">
                        <img src="/images/flags/${language}.png">&nbsp;
                        <fmt:message key="footer.language"/>&nbsp;
                        <span class="caret"></span>
                    </a></li>
                </ul>
                <ul class='nav navbar-nav' id="language-menu" style="display: none;">
                    <li><a href='/FrontController?command=ChangeLanguageCommand&language=en'><img
                            src='/images/flags/en.png'>&nbsp;English</a></li>
                    <li><a href='/FrontController?command=ChangeLanguageCommand&language=de'><img
                            src='/images/flags/de.png'>&nbsp;Deutsch</a></li>
                    <li><a href='/FrontController?command=ChangeLanguageCommand&language=es'><img
                            src='/images/flags/es.png'>&nbsp;Español</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (request.getSession().getAttribute("user") != null) { %>
                    <li id="tac-button"><a href="javascript:void(0)"><fmt:message key="footer.termsAndConditions"/></a>
                    </li>
                    <li><a href="mailto:ayuda@chronomed.com"><fmt:message key="footer.help"/></a></li>
                    <%} else {%>
                    <li><a href="#intro"><fmt:message key="footer.home"/></a></li>
                    <li class=""><a href="#services"><fmt:message key="footer.services"/></a></li>
                    <li class=""><a href="#team"><fmt:message key="footer.team"/></a></li>
                    <li><a href="#contact"><fmt:message key="footer.contact"/></a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
    <script>
        $("#language-selector").click(function () {
            $("#language-selector-container").fadeOut("fast", function () {
                $("#language-menu").slideDown("slow", function () {
                });
            });
        });
    </script>
    <%@include file="message.jsp" %>
    <%@include file="tac.jsp" %>
