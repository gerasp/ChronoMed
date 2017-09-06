<form:form action="/patient/edit" modelAttribute="patient" cssClass="form-vertical">
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <%@include file="form-patient-personal.jsp" %>
        <%@include file="form-patient-doctors.jsp" %>
        <%@include file="form-patient-healthcards.jsp" %>
        <%@include file="form-patient-address.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
        <p><fmt:message key="form.requiredFields.some"/></p>
    </div>
</form:form>

