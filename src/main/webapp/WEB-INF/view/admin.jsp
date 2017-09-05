<%@include file="header.jsp" %>
<body class="body-grey">
<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="<c:url value="/static/images/ChronoMed.png"/>" class="img-responsive img-logo">
            </div>
            <div class="col-md-9 text-right welcome-message">
                <h3><fmt:message key="navigation.greetings"/>,
                    <span class="label label-primary"><fmt:message key="navigation.admin"/></span>
                </h3>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-justified nav-tabs">
                <li <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("patient")}'>class="active"</c:if>>
                    <a href="<c:url value="/admin/patients"/>"><i class="fa  fa-lg fa-user"></i>&nbsp;
                        <fmt:message key="navigation.patient.management"/></a>
                </li>
                <li <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("doctor")}'>class="active"</c:if>>
                    <a href="<c:url value="/admin/doctors"/>"><i class="fa  fa-lg fa-user-md"></i>&nbsp;
                        <fmt:message key="navigation.doctor.management"/></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="white-container">
                <c:choose>
                <c:when test="${action<3}"><%@include file="admin-patients.jsp" %></c:when>
                <c:otherwise><%@include file="admin-doctors.jsp" %></c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>