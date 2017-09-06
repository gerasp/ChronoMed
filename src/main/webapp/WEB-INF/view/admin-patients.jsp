<c:choose>
    <c:when test="${action == 0}">
        <div class="row">
            <div class="col-md-4">
                <a class="btn btn-primary btn-lg  register-button"
                   href="<c:url value="/admin/patient/registration"/>">
                    <i class="fa  fa-plus-circle"></i>&nbsp;
                    <fmt:message key="navigation.patient.registration"/>
                </a>
            </div>
            <div class="col-md-8">
                <form:form action="/admin/patient/search" modelAttribute="search"
                           cssClass="form-horizontal" method="get">
                    <div class="input-group input-group-lg">
                        <div class="input-group-btn">
                            <form:select path="type" cssClass="btn btn-default dropdown-toggle">
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">
                                            <form:option value="idCard"><fmt:message key="form.idcard"/>
                                            </form:option>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <form:option value="healthCard"><fmt:message key="form.healthcard"/>
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
        <div class="row">
            <img src="<c:url value="/static/images/svg/male-patient.svg"/>"
                 class="img-responsive col-sm-6 hidden-xs">
            <img src="<c:url value="/static/images/svg/female-patient.svg"/>"
                 class="img-responsive col-sm-6 col-xs-12">
        </div>
        <div class="well text-center">
            <i class="fa fa-info-circle"></i>&nbsp;
            <fmt:message key="search.patient.info"/>
        </div>
    </c:when>
    <c:when test="${action == 1}">
        <%@include file="admin-patient-new.jsp" %>
    </c:when>
    <c:when test="${action == 2}">
        <%@include file="admin-patient-edit.jsp" %>
    </c:when>
    <c:otherwise>undefined</c:otherwise>
</c:choose>