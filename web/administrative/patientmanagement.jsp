<%@page import="data.entities.Patient" %>
<%@page import="java.util.List" %>
<%@include file="/header.jsp" %>
<body class="body-background">

<%@include file="navigation.jsp" %>
<%
    List<Patient> nifPatientList = (List<Patient>) request.getAttribute("patients");
    List<Patient> healthCardPatientList = (List<Patient>) request.getAttribute("healthcardPatients");
%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="signin-form-container">
                <div class="row">
                    <div class="col-md-4">
                        <a class="btn btn-lg btn-primary register-button"
                           href="/administrative/patientregistration.jsp"><i class="fa  fa-plus-circle"></i>&nbsp;<fmt:message key="navigation.patient.registration" /></a>
                    </div>
                    <div class="col-md-4">
                        <form class="form-horizontal" method="GET" role="form" action="/FrontController">
                            <input type="hidden" value="SearchPatientByHealthcardCommand" name="command">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" placeholder="<fmt:message key="form.healthcardNumber" />"
                                       name="searchHealthCardNumber">
                                <span class="input-group-addon" id="basic-addon2">
                                            <button class="btn-link" type="submit"><i class="fa  fa-search"></i></button>
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
                                            <button class="btn-link" type="submit"><i class="fa  fa-search"></i></button>
                                        </span>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="list-group">
                    <% if (nifPatientList == null && healthCardPatientList == null) {%>
                    <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-info-circle"></i>&nbsp;<fmt:message key="search.patient.info" /></span></h2>
                    <%
                    } else if (nifPatientList != null && !nifPatientList.isEmpty()) {
                        for (Patient patient : nifPatientList) {
                    %>
                    <a href="/administrative/patientedit.jsp?id=<%= patient.getId()%>"
                       class="list-group-item">
                        <h4 class="list-group-item-heading"><%= patient.getName()%> <%= patient.getSurname()%><i
                                class="-circle fa fa-2x  pull-right text-primary fa-angle-right"></i></h4>
                        <p class="list-group-item-text">
                            <%= patient.getNif()%>
                        </p>
                    </a>
                    <%
                        }
                    } else if (healthCardPatientList != null && !healthCardPatientList.isEmpty()) {
                        for (Patient patient : healthCardPatientList) {

                    %>
                    <a href="/ChronoMed/administrative/patientedit.jsp?id=<%= patient.getId()%>"
                       class="list-group-item">
                        <h4 class="list-group-item-heading"><%= patient.getName()%> <%= patient.getSurname()%><i
                                class="-circle fa fa-2x  pull-right text-primary fa-angle-right"></i></h4>
                        <p class="list-group-item-text">
                            <%= patient.getNif()%>
                        </p>
                    </a>

                    <%
                        }
                    } else {
                    %>
                    <h2 style="text-align: center;"><span class="label label-default"><i
                            class="fa fa-exclamation-circle"></i> No se ha encontrado ning�n paciente</span></h2>

                    <%
                        }
                    %>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>