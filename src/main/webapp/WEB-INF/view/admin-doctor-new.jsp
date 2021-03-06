<form:form action="/admin/doctor/new" modelAttribute="doctor" >
    <div class="row">
        <div class="col-md-2">
            <a href="<c:url value="/admin/doctors"/>" class="btn btn-block btn-lg btn-link ">
                <i class="fa fa-arrow-circle-left"></i>&nbsp<fmt:message key="form.back"/></a>
        </div>
        <div class="col-md-8">
            <h3 class="form-title text-center"><fmt:message key="form.doctor.registration"/></h3>
        </div>
        <div class="col-md-2">
            <form:button class="btn btn-lg btn-block btn-link pull-right">
                <fmt:message key="form.submit"/>&nbsp;<i class="fa fa-check-circle"></i>
            </form:button>
        </div>
    </div>
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion">
        <%@include file="form-doctor-personal.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
    </div>
</form:form>
