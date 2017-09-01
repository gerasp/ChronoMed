<%@page import="java.util.List" %>
<%@page import="data.entities.Patient" %>
<%@include file="/header.jsp" %>
<body class="body-background">

<div class="container">
    <div class="row">
        <%@include file="navigation.jsp" %>
        <%
            List<Patient> nifPatientList = (List<Patient>) request.getAttribute("patients");
            List<Patient> healthCardPatientList = (List<Patient>) request.getAttribute("healthcardPatients");
        %>
        <div class="col-md-9">
            <div class="white-container">
                <div class="row">
                    <div class="col-md-6">
                        <form class="form-horizontal" method="GET" role="form" action="/FrontController">
                            <input type="hidden" value="SearchMyPatientsByHealthcardCommand" name="command">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" placeholder="<fmt:message key="form.healthcard" />"
                                       name="searchHealthCardNumber">
                                <span class="input-group-addon" id="basic-addon2">
                                            <button class="btn-link" type="submit"><i class="fa  fa-search"></i></button>
                                        </span>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6">
                        <form class="form-horizontal" method="GET" role="form" action="/FrontController">
                            <input type="hidden" value="SearchMyPatientsByNifCommand" name="command">
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
                    <h3 class="text-center"><span class="label label-default"><i class="fa fa-info-circle"></i>&nbsp;<fmt:message key="search.patient.info2" /></span>
                    </h3>
                    <%
                    } else if (nifPatientList != null && !nifPatientList.isEmpty()) {
                        for (Patient patient : nifPatientList) {
                    %>
                    <a href="/doctor/vistapacienteshistory.jsp?id=<%= patient.getId()%>" class="list-group-item">
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
                    <a href="/doctor/vistapacienteshistory.jsp?id=<%= patient.getId()%>" class="list-group-item">
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
                    <h3 class="text-center"><span class="label label-default"><i
                            class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="search.patient.notFound" /></span></h3>
                    <%}%>

                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>

</body>
</html>