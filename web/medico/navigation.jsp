<%@page import="data.facades.DoctorFacade"%>
<%@page import="data.entities.Doctor"%>
<%@page import="javax.naming.InitialContext"%>

<% DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
    Doctor doctor = (Doctor) request.getSession().getAttribute("user");%>
<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/ChronoMed/images/ChronoMed.png" class="img-responsive">
            </div>
            <div class="col-md-9" id="print2">
                <div class="text-right">
                    <h1>Saludos,
                        Dr<% if (doctor.getGender().equals("Femenino")) {
                                out.print("a");
                            }%>. <span class="label label-primary"><%= doctor.getSurname()%></span>
                    </h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-md-3" id="print1">
    <div class="list-group">
        <a class="list-group-item
           <% if (request.getRequestURI().contains("pacientes")) { %> active<% }%>"
           href="/ChronoMed/medico/pacientes.jsp">Mis pacientes</a>
        <a class="list-group-item
           <% if (request.getRequestURI().contains("datos")) { %> active<% }%>"
           href="/ChronoMed/medico/datos.jsp">Mis datos</a>
    </div>
</div>
