<c:choose>
    <c:when test="${user!=null}">
        <div class="section"></div>
        <div class="bottom-navbar navbar navbar-default navbar-fixed-bottom navbar-inverse">
    </c:when>
    <c:otherwise>
        <div class="navbar navbar-inverse" id="nav" style="margin-top:-50px;">
    </c:otherwise>
</c:choose>

<div class="container">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
        </button>
        <c:choose>
            <c:when test="${user!=null}">
                <a class="navbar-brand" href="<c:url value="/logout"/>">
                    <i class="fa fa-sign-out"></i>&nbsp;<fmt:message key="footer.logout"/>
                </a>
            </c:when>
            <c:otherwise>
                <a class="navbar-brand">&copy; ChronoMed 2017</a>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="collapse navbar-collapse" id="navbar-ex-collapse">
        <ul class="nav navbar-nav" id="language-selector-container">
            <li><a href="javascript:void(0)" id="language-selector">
                <img src="<c:url value="/static/images/flags/${language}.png"/>">&nbsp;
                <fmt:message key="footer.language"/>&nbsp;
                <span class="caret"></span>
            </a></li>
        </ul>
        <ul class="nav navbar-nav" id="language-menu" style="display: none;">
            <li><a href="<c:url value="/changeLanguage?language=en&returnTo=${requestScope['javax.servlet.forward.request_uri']}"/>">
                <img src="<c:url value="/static/images/flags/en.png"/>">&nbsp;English</a></li>
            <li><a href="<c:url value="/changeLanguage?language=de&returnTo=${requestScope['javax.servlet.forward.request_uri']}"/>">
                <img src="<c:url value="/static/images/flags/de.png"/>">&nbsp;Deutsch</a></li>
            <li><a href="<c:url value="/changeLanguage?language=es&returnTo=${requestScope['javax.servlet.forward.request_uri']}"/>">
                <img src="<c:url value="/static/images/flags/es.png"/>">&nbsp;Espa&ntilde;ol</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${user!=null}">
                    <li><a href="<c:url value="/tac"/>"><fmt:message key="footer.termsAndConditions"/></a></li>
                    <li><a href="mailto:ayuda@chronomed.com"><fmt:message key="footer.help"/></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="#intro"><fmt:message key="footer.home"/></a></li>
                    <li><a href="#services"><fmt:message key="footer.services"/></a></li>
                    <li><a href="#contact"><fmt:message key="footer.contact"/></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
</div>
<%@include file="message.jsp" %>

<script src="<c:url value="/static/js/utils.js"/>"></script>
