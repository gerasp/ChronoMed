<c:choose>
    <c:when test="${action.equals('doctors')}">
        <div class="row">
            <div class="col-md-4">
                <a class="btn btn-primary btn-lg  register-button"
                   href="<c:url value="/admin/doctor/new"/>">
                    <i class="fa  fa-plus-circle"></i>&nbsp;
                    <fmt:message key="navigation.doctor.registration"/>
                </a>
            </div>
            <div class="col-md-8">
                <form:form action="/admin/doctor/edit" modelAttribute="search"
                           cssClass="form-horizontal" method="get">
                    <div class="input-group input-group-lg">
                        <div class="input-group-btn">
                            <form:select path="type" cssClass="btn btn-default dropdown-toggle">
                                <ul class="dropdown-menu">
                                    <li><a href="#">
                                        <form:option value="boardNumber"><fmt:message key="form.boardNumber"/>
                                        </form:option>
                                    </a></li>
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
        <div class="row">
            <img src="<c:url value="/static/images/svg/male-doctor.svg"/>"
                 class="img-responsive col-sm-6 col-xs-12">
            <img src="<c:url value="/static/images/svg/female-doctor.svg"/>"
                 class="img-responsive col-sm-6 hidden-xs">
        </div>
        <div class="well text-center">
            <i class="fa fa-info-circle"></i>&nbsp;
            <fmt:message key="search.doctor.info"/>
        </div>
    </c:when>
    <c:when test="${action.equals('doctor-new')}">
        <%@include file="admin-doctor-new.jsp" %>
    </c:when>
    <c:when test="${action.equals('doctor-edit')}">
        <%@include file="admin-doctor-edit.jsp" %>
    </c:when>

</c:choose>
