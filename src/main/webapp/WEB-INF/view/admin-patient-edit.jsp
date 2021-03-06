<form:form action="/admin/patient/edit" modelAttribute="patient" >
    <div class="row">
        <div class="col-md-2">
            <a href="<c:url value="/admin/patients"/>" class="btn btn-block btn-lg btn-link ">
                <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
            </a>
        </div>
        <div class="col-md-8">
            <h3 class="form-title text-center">${patient.name}&nbsp;${patient.surname}</h3>
        </div>
        <div class="col-md-2">
            <form:button class="btn btn-lg btn-block btn-link pull-right">
                <fmt:message key="form.data.save"/>&nbsp;<i class="fa fa-check-circle"></i>
            </form:button>
        </div>
    </div>
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion">
        <%@include file="form-patient-personal.jsp" %>
        <%@include file="form-patient-doctors.jsp" %>
        <%@include file="form-patient-healthcards.jsp" %>
        <%@include file="form-patient-address.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
    </div>
</form:form>
