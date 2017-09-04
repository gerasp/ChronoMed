<%@page import="data.entities.Doctor" %>
<% Doctor doctor = (Doctor) user;%>
<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/images/ChronoMed.png" class="img-responsive">
            </div>
            <div class="col-md-9 text-right welcome-message">
                <h2><fmt:message key="navigation.greetings"/>,
                    <% if (doctor.getGender().equals("Femenino")) { %>
                    <fmt:message key="navigation.doctor.female"/>
                    <% } else { %>
                    <fmt:message key="navigation.doctor.male" />
                    <% } %>
                    <span class="label label-primary">&nbsp;<%= doctor.getSurname()%></span>
                </h2>
            </div>
        </div>
    </div>
</div>

<div class="col-md-3">
    <div class="list-group">
        <a class="list-group-item
           <% if (request.getRequestURI().contains("patients")) { %> active<% }%>"
           href="/doctor/patients.jsp"><fmt:message key="navigation.myPatients" /></a>
        <a class="list-group-item
           <% if (request.getRequestURI().contains("data")) { %> active<% }%>"
           href="/doctor/data.jsp"><fmt:message key="navigation.myData" /></a>
    </div>
</div>
