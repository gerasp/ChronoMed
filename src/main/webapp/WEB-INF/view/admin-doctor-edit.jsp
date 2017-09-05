<form:form action="/admin/doctor/edit" modelAttribute="doctor" cssClass="form-vertical">
    <div class="row">
        <div class="col-md-2">
            <a href="<c:url value="/admin/doctors"/>" class="btn btn-block btn-lg btn-link ">
                <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
            </a>
        </div>
        <div class="col-md-8">
            <h1 class="form-title text-center">&nbsp<fmt:message key="form.doctor.registration"/></h1>
        </div>
        <div class="col-md-2">
            <form:button class="btn btn-lg btn-block btn-link pull-right">
                <fmt:message key="form.data.save"/>&nbsp;<i class="fa  fa-check-circle"></i>
            </form:button>
        </div>
    </div>
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <%@include file="form-admin-doctor-personal.jsp" %>
    <%@include file="form-admin-access.jsp" %>
    <p><fmt:message key="form.requiredFields.some"/></p>
</form:form>
