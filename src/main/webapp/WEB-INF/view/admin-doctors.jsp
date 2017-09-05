<c:choose>
    <c:when test="${action == 3}">
        <div class="row">
            <div class="col-sm-4">
                <a class="btn btn-primary btn-lg  register-button"
                   href="<c:url value="/admin/patient/registration"/>">
                    <i class="fa  fa-plus-circle"></i>&nbsp;
                    <fmt:message key="navigation.patient.registration"/>
                </a>
            </div>
            <div class="col-sm-8">
                <form:form action="/admin/patient/search" modelAttribute="searchByBoardNumber"
                           cssClass="form-horizontal" method="get">
                    <div class="input-group input-group-lg">
                        <fmt:message key="form.boardNumber" var="boardNumberMessage"/>
                        <form:input path="parameter" cssClass="form-control"
                                    placeholder="${boardNumberMessage}"/>
                        <span class="input-group-addon">
                                                    <form:button class="btn-link">
                                                        <i class="fa  fa-search"></i>
                                                    </form:button>
                                                </span>
                    </div>
                </form:form>
            </div>
        </div>
        <img src="<c:url value="/static/images/stethoscope.png"/>"
             class="img-background center-block img-responsive">
        <div class="well text-center">
            <i class="fa fa-info-circle"></i>&nbsp;
            <fmt:message key="search.patient.info"/>
        </div>
    </c:when>
    <c:when test="${action == 4}">
        <%@include file="admin-patient-edit.jsp" %>
    </c:when>
    <c:when test="${action == 5}">
        <%@include file="admin-patient-new.jsp" %>
    </c:when>
    <c:otherwise>undefined</c:otherwise>
</c:choose>
