<%@page import="data.entities.Patient" %>
<% Patient patient = (Patient) request.getSession().getAttribute("user");%>
<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/images/ChronoMed.png" class="img-responsive">
            </div>
            <div class="col-md-9">
                <div class="text-right">
                    <h2><fmt:message key="navigation.greetings"/>,
                        <% if (patient.getGender().equals("Femenino")) { %>
                        <fmt:message key="navigation.patient.female"/>
                        <% } else { %>
                        <fmt:message key="navigation.patient.male" />
                        <% } %>
                        <span class="label label-primary">&nbsp;<%= patient.getSurname()%></span>
                    </h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-3" id="print1">
    <div class="list-group">
        <a href="/patient/history.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("history")) { %> active<% }%>">
            <fmt:message key="navigation.myMedicalHistory"/></a>
        <a href="/patient/consultations.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("consultations")) { %> active<% }%>">
            <fmt:message key="navigation.myMedicalConsultations"/></a>
        <a href="/patient/doctors.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("doctors")) { %> active<% }%>">
            <fmt:message key="navigation.myDoctors"/></a>
        <a href="/patient/data.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("data")) { %> active<% }%>">
            <fmt:message key="navigation.myData"/></a>
    </div>
</div>
