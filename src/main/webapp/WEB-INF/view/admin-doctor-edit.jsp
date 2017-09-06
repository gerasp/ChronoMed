<c:choose>
    <c:when test="${doctor!=null}">
        <form:form action="/admin/doctor/edit" modelAttribute="doctor" cssClass="form-vertical">
            <div class="row">
                <div class="col-md-2">
                    <a href="<c:url value="/admin/doctors"/>" class="btn btn-block btn-lg btn-link ">
                        <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
                    </a>
                </div>
                <div class="col-md-8">
                    <h3 class="form-title text-center">${doctor.name}&nbsp;${doctor.surname}</h3>
                </div>
                <div class="col-md-2">
                    <form:button class="btn btn-lg btn-block btn-link pull-right">
                        <fmt:message key="form.data.save"/>&nbsp;<i class="fa fa-check-circle"></i>
                    </form:button>
                </div>
            </div>
            <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
            <div class="panel-group" id="accordion">
                <%@include file="form-doctor-personal.jsp" %>
                <%@include file="form-contact.jsp" %>
                <%@include file="form-access.jsp" %>
            </div>
            <p><fmt:message key="form.requiredFields.some"/></p>
        </form:form>
    </c:when>
    <c:otherwise>
        <div class="row">
            <div class="col-md-2">
                <a href="<c:url value="/admin/doctors"/>" class="btn btn-block btn-lg btn-link ">
                    <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
                </a>
            </div>
            <div class="col-md-10">
                <div class="well text-center">
                    <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="search.doctor.notFound"/>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>


