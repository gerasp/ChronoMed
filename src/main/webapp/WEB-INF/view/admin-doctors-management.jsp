<%@include file="header.jsp" %>
<body class="body-background">
<%@include file="admin-navigation.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="white-container">
                <div class="row">
                    <div class="col-md-7">
                        <a class="btn btn-primary btn-lg register-button" href="<c:url value="/admin/doctor/new"/>">
                            <i class="fa  fa-plus-circle"></i>&nbsp;
                            <fmt:message key="navigation.doctor.registration"/>
                        </a>
                    </div>
                    <div class="col-md-5">
                        <form:form action="/admin/doctor/edit" modelAttribute="searchByBoardNumber" cssClass="form-horizontal">
                            <div class="input-group input-group-lg">
                                <fmt:message key="form.boardNumber" var="boardNumberMessage"/>
                                <form:input path="parameter" cssClass="form-control"
                                            placeholder="${boardNumberMessage}"/>
                                <span class="input-group-addon" id="basic-addon2">
                                    <form:button class="btn-link"><i class="fa  fa-search"></i></form:button>
                                </span>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="list-group">
                    <c:choose>
                        <c:when test="${doctor==null}">
                            <div class="well well-lg  text-center">
                                <i class="fa fa-info-circle"></i>&nbsp;
                                <fmt:message key="search.doctor.info"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%@include file="admin-doctors-edit.jsp" %>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>