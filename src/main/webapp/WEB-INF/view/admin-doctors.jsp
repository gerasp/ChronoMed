<%@include file="header.jsp" %>
<body class="body-background">
<%@include file="admin-navigation.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="white-container">
                <c:choose>
                    <c:when test="${doctor!=null}">
                        <%@include file="admin-doctor-edit.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${registry!=null}">
                                <%@include file="admin-doctor-new.jsp" %>
                            </c:when>
                            <c:otherwise>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <a class="btn btn-primary btn-lg  register-button"
                                           href="<c:url value="/admin/doctor/registration"/>">
                                            <i class="fa  fa-plus-circle"></i>&nbsp;
                                            <fmt:message key="navigation.doctor.registration"/>
                                        </a>
                                    </div>
                                    <div class="col-sm-8">
                                        <form:form action="/admin/doctor/search" modelAttribute="searchByBoardNumber"
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
                                    <fmt:message key="search.doctor.info"/>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>