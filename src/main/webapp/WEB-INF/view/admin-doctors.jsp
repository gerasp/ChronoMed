<c:choose>
    <c:when test="${action == 3}">
        <div class="row">
            <div class="col-md-4">
                <a class="btn btn-primary btn-lg  register-button"
                   href="<c:url value="/admin/doctor/registration"/>">
                    <i class="fa  fa-plus-circle"></i>&nbsp;
                    <fmt:message key="navigation.doctor.registration"/>
                </a>
            </div>
            <div class="col-md-8">
                <form:form action="/admin/doctor/search" modelAttribute="search"
                           cssClass="form-horizontal" method="get">
                    <div class="input-group input-group-lg">
                        <div class="input-group-btn">
                            <form:select path="type" cssClass="btn btn-default dropdown-toggle">
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">
                                            <form:option value="boardNumber"><fmt:message key="form.boardNumber"/>
                                            </form:option>
                                        </a>
                                    </li>
                                </ul>
                            </form:select>
                        </div>
                        <form:input path="parameter" cssClass="form-control"/>
                        <span class="input-group-addon">
                            <form:button class="btn-link"><i class="fa  fa-search"></i></form:button>
                        </span>
                    </div>
                </form:form>
            </div>
        </div>
        <img src="<c:url value="/static/images/doctors.png"/>"
             class="img-background center-block img-responsive">
        <div class="well text-center">
            <i class="fa fa-info-circle"></i>&nbsp;
            <fmt:message key="search.doctor.info"/>
        </div>
    </c:when>
    <c:when test="${action == 4}">
        <%@include file="admin-doctor-edit.jsp" %>
    </c:when>
    <c:when test="${action == 5}">
        <%@include file="admin-doctor-new.jsp" %>
    </c:when>
    <c:otherwise>undefined</c:otherwise>
</c:choose>
