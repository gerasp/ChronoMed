<form:form action="/doctor/data" modelAttribute="doctor">
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <div class="panel-group" id="accordion">
        <%@include file="form-doctor-personal.jsp" %>
        <%@include file="form-contact.jsp" %>
        <%@include file="form-access.jsp" %>
    </div>
    <div class="row">
        <div class="col-md-9">
            <p class="red-asterisk">
                <b><fmt:message key="form.requiredFields.some"/></b>
            </p>
        </div>
        <div class="col-md-3">
            <form:button class="btn btn-primary btn-block">
                <fmt:message key="form.data.save"/>&nbsp;<i class="fa fa-save"></i>
            </form:button>
        </div>
    </div>
</form:form>

<script>
    $("#doctor-personal").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled", "true");
</script>
