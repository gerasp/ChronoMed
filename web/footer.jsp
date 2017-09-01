<% if (request.getSession().getAttribute("user") != null) { %>
<div class="section"></div>
<div class="bottom-navbar navbar navbar-default navbar-fixed-bottom navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/FrontController?command=LogoutCommand"><i class="fa  fa-sign-out"></i>&nbsp;<fmt:message key="footer.logout" /></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a id="openModal2Button"><img src="/images/flags/${language}.png">&nbsp;<span class="caret"></span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/tac.jsp"><fmt:message key="footer.termsAndConditions" /></a>
                </li>
                <li>
                    <a href="mailto:ayuda@chronomed.com"><fmt:message key="footer.help" /></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<% } else { %>
<div class="navbar navbar-inverse" id="nav" style="margin-top:-50px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">@ ChronoMed 2017</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a id="openModal2Button"><img src="/images/flags/${language}.png">&nbsp;<span class="caret"></span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#intro"><fmt:message key="footer.home" /></a>
                </li>
                <li class="">
                    <a href="#services"><fmt:message key="footer.services" /></a>
                </li>
                <li class="">
                    <a href="#team"><fmt:message key="footer.team" /></a>
                </li>
                <li>
                    <a href="#contact"><fmt:message key="footer.contact" /></a>
                </li>
            </ul>
        </div>
    </div>
</div>

<% } %>

<%@include file="message.jsp" %>
