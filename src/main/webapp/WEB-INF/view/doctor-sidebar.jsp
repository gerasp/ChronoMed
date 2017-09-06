<c:choose>
    <c:when test='${doctor.gender.equals("male")}'>
        <img src="<c:url value="/static/images/svg/male-doctor.svg"/>" class="img-responsive">
    </c:when>
    <c:when test='${doctor.gender.equals("female")}'>
        <img src="<c:url value="/static/images/svg/female-doctor.svg"/>" class="img-responsive">
    </c:when>
    <c:otherwise>undefined</c:otherwise>
</c:choose>
<div class="list-group">
    <a href="<c:url value="/doctor/patients"/>" class="list-group-item
        <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("patient")}'> active</c:if>">
        <fmt:message key="navigation.myPatients"/></a>
    <a href="<c:url value="/doctor/data"/>" class="list-group-item
        <c:if test='${requestScope["javax.servlet.forward.request_uri"].contains("data")}'> active</c:if>">
        <fmt:message key="navigation.myData"/></a>
</div>