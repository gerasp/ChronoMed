<form:form action="/doctor/edit" modelAttribute="doctor" >
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion">
        <%@include file="form-doctor-personal.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
    </div>
    <p><fmt:message key="form.requiredFields.some"/></p>
</form:form>

<script>
    $("#doctor-personal").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled","true");
</script>
