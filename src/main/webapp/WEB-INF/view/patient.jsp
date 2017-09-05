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
                    <c:choose>
                        <c:when test='${patient.gender.equals("male")}'><fmt:message
                                key="navigation.patient.male"/></c:when>
                        <c:when test='${patient.gender.equals("female")}'><fmt:message key="navigation.patient.female"/></c:when>
                        <c:otherwise>undefined</c:otherwise>
                    </c:choose>
                    <span class="label label-primary">${patient.surname}</span>
                </h3>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <c:choose>
                <c:when test='${patient.gender.equals("male")}'>
                    <img src="<c:url value="/static/images/svg/male-patient.svg"/>" class="img-responsive">
                </c:when>
                <c:when test='${patient.gender.equals("female")}'>
                    <img src="<c:url value="/static/images/svg/female-patient.svg"/>" class="img-responsive">
                </c:when>
                <c:otherwise>undefined</c:otherwise>
            </c:choose>
            <div class="list-group">
                <a href="<c:url value="/patient/history"/>" class="list-group-item
        <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("history")}'> active</c:if>">
                    <fmt:message key="navigation.myMedicalHistory"/></a>
                <a href="<c:url value="/patient/consultations"/>" class="list-group-item
        <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("consultations")}'> active</c:if>">
                    <fmt:message key="navigation.myMedicalConsultations"/></a>
                <a href="<c:url value="/patient/doctors"/>" class="list-group-item
        <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("doctors")}'> active</c:if>">
                    <fmt:message key="navigation.myDoctors"/></a>
                <a href="<c:url value="/patient/data.jsp"/>" class="list-group-item
        <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("data")}'> active</c:if>">
                    <fmt:message key="navigation.myData"/></a>
            </div>
        </div>
        <div class="col-md-9 print">
            <div class="white-container">
                <c:choose>
                    <c:when test="${action == 0}">
                        <%@include file="patient-history.jsp" %>
                    </c:when>
                    <c:when test="${action == 1}">
                        <%@include file="patient-consultations.jsp" %>
                    </c:when>
                    <c:when test="${action == 2}">AAA</c:when>
                    <c:when test="${action == 3}">AAA</c:when>
                    <c:otherwise>undefined</c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>