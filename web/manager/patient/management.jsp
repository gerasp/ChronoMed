<%@page import="data.entities.Patient" %>
<%@page import="java.util.List" %>
<%@include file="/header.jsp" %>
<body class="body-background">

<%@include file="../navigation.jsp" %>
<%
    List<Patient> nifPatientList = (List<Patient>) request.getAttribute("patients");
    List<Patient> healthCardPatientList = (List<Patient>) request.getAttribute("healthcardPatients");
%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="white-container">
                <div class="row">
                    <div class="col-md-4">
                        <a class="btn btn-lg btn-primary register-button"
                           href="/manager/patient/registration.jsp"><i class="fa  fa-plus-circle"></i>&nbsp;<fmt:message
                                key="navigation.patient.registration"/></a>
                    </div>
                    <div class="col-md-4">
                        <form class="form-horizontal" method="GET" role="form" action="/FrontController">
                            <input type="hidden" value="SearchPatientByHealthcardCommand" name="command">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control"
                                       placeholder="<fmt:message key="form.healthcard" />"
                                       name="searchHealthCardNumber">
                                <span class="input-group-addon" id="basic-addon2">
                                            <button class="btn-link" type="submit"><i
                                                    class="fa  fa-search"></i></button>
                                        </span>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-4">
                        <form class="form-horizontal" method="GET" role="form" action="/FrontController">
                            <input type="hidden" value="SearchPatientByNifCommand" name="command">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" placeholder="<fmt:message key="form.idcard" />"
                                       name="searchNif">
                                <span class="input-group-addon" id="basic-addon3">
                                            <button class="btn-link" type="submit"><i
                                                    class="fa  fa-search"></i></button>
                                        </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="list-group">
                    <% if (nifPatientList == null && healthCardPatientList == null) {%>
                    <div class="well well-lg text-center">
                        <i class="fa fa-info-circle"></i>&nbsp;<fmt:message key="search.patient.info"/>
                    </div>
                    <% } else if (nifPatientList != null && !nifPatientList.isEmpty()) {
                        Patient patient = healthCardPatientList.get(0);
                    %>
                    <%@include file="/manager/patient/edit.jsp" %>

                    <%
                    } else if (healthCardPatientList != null && !healthCardPatientList.isEmpty()) {
                        Patient patient = healthCardPatientList.get(0);
                    %>
                    <%@include file="/manager/patient/edit.jsp" %>
                    <%
                    } else { %>
                    <div class="well well-lg text-center">
                        <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="search.patient.notFound"/>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>