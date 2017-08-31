<%@page import="data.facades.PatientFacade"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="data.entities.Patient"%>
<% PatientFacade patientFacade = InitialContext.doLookup("java:global/ChronoMed/PatientFacade");
    Patient patient = (Patient) request.getSession().getAttribute("user");%>
<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/ChronoMed/images/ChronoMed.png" class="img-responsive">
            </div>
            <div class="col-md-9">
                <div class="text-right">
                    <h1>Saludos,
                        Sr<% if (patient.getGender().equals("Femenino")) {
                                out.print("a");
                            }%>. <span class="label label-primary"><%= patient.getSurname()%></span>
                    </h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-3" id="print1">
    <div class="list-group">
        <a href="/ChronoMed/paciente/historial.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("historial")) { %> active<% }%>">
            Mi historial médico</a>
        <a href="/ChronoMed/paciente/citas.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("citas")) { %> active<% }%>">
            Mi historial de citas</a>
        <a href="/ChronoMed/paciente/medicos.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("medicos")) { %> active<% }%>">
            Mis médicos</a>    
        <a href="/ChronoMed/paciente/datos.jsp" class="list-group-item
           <% if (request.getRequestURI().contains("datos")) { %> active<% }%>">
            Mis datos</a>
    </div>
</div>
