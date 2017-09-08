<form:form action="/patient/data" modelAttribute="patient" >
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion">
        <%@include file="form-patient-personal.jsp" %>
        <%@include file="form-patient-healthcards.jsp" %>
        <%@include file="form-patient-address.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
    </div>
    <div class="row">
        <div class="col-md-9">
            <p class="red-asterisk">
                <b><fmt:message key="form.requiredFields.contactAdmin"/><br><fmt:message key="form.requiredFields.some"/></b>
            </p>
        </div>
        <div class="col-md-3">
            <form:button class="btn btn-primary btn-block">
                <fmt:message key="form.data.save"/>&nbsp;<i class="fa fa-check-circle"></i>
            </form:button>
        </div>
    </div>
</form:form>

<script>
    $("#patient-personal").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled","true");
    $("#patient-healthcards").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled","true");
    $(".remove-button").hide();
</script>
