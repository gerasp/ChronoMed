<form:form action="/patient/edit" modelAttribute="patient" cssClass="form-vertical">
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion">
        <%@include file="form-patient-personal.jsp" %>
        <%@include file="form-patient-healthcards.jsp" %>
        <%@include file="form-patient-address.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
        <p><fmt:message key="form.requiredFields.some"/></p>
    </div>
</form:form>

<script>
    $("#patient-personal").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled","true");
    $("#patient-healthcards").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled","true");
</script>
