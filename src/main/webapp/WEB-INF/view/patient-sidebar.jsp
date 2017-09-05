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