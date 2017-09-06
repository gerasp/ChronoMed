<%@include file="header.jsp" %>
<body class="background-grey">
<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="<c:url value="/static/images/ChronoMed.png"/>" class="img-responsive img-logo">
            </div>
            <div class="col-md-9 welcome-message text-right">
                <h3><fmt:message key="navigation.greetings"/>,
                    <c:choose>
                        <c:when test='${patient.gender.equals("male")}'><fmt:message
                                key="navigation.patient.male"/></c:when>
                        <c:when test='${patient.gender.equals("female")}'><fmt:message key="navigation.patient.female"/></c:when>
                    </c:choose>
                    <span class="label label-primary">${patient.surname}</span>
                </h3>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-3 hidden-xs hidden-sm sidebar">
            <%@include file="patient-sidebar.jsp" %>
        </div>
        <div class="col-md-9 print">
            <div class="white-container">
                <c:choose>
                    <c:when test="${action.equals('history')}">
                        <%@include file="history.jsp" %>
                    </c:when>
                    <c:when test="${action.equals('consultations')}">
                        <%@include file="consultations.jsp" %>
                    </c:when>
                    <c:when test="${action.equals('doctors')}">
                        <%@include file="patient-doctors.jsp" %>
                    </c:when>
                    <c:when test="${action.equals('data')}">
                        <%@include file="patient-data.jsp" %>
                    </c:when>

                </c:choose>
            </div>
        </div>
        <div class="col-md-3 hidden-md hidden-lg" id="sidebar-mobile">
            <%@include file="patient-sidebar.jsp" %>
        </div>
    </div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>