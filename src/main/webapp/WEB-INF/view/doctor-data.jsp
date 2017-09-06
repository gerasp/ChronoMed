<form:form action="/doctor/edit" modelAttribute="doctor" cssClass="form-vertical" cssStyle="padding-top: 30px;">
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <%@include file="form-doctor-personal.jsp" %>
    <%@include file="form-contact.jsp" %>
    <%@include file="form-access.jsp" %>
    <p><fmt:message key="form.requiredFields.some"/></p>
</form:form>

