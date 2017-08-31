<%@page import="data.entities.Doctor"%>
<%@page import="data.facades.DoctorFacade"%>
<%@page import="data.facades.PatientFacade"%>
<%@page import="java.util.List"%>
<%@page import="data.entities.Patient"%>
<html>
    <%@include file="../head.jsp" %>        
    <body class="body-background">
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <div class="col-md-9">
                    <div class="signin-form-container">
                        <div class="list-group">
                            <% 
                                DoctorFacade doctorFacade = InitialContext.doLookup("java:global/ChronoMed/DoctorFacade");
                                List<Doctor> doctorList = doctorFacade.findByPatient(patient);
                                
                                if (doctorList != null && !doctorList.isEmpty()) {
                                for (Doctor doctor : doctorList) {
                            %>
                            <a class="list-group-item">
                                <h4 class="list-group-item-heading"><%= doctor.getName()%> <%= doctor.getSurname()%></h4>
                                <p class="list-group-item-text">
                                    Nº colegiado: <%= doctor.getBoardNumber()%> | Especialidad: <%= doctor.getSpeciality() %> | Nº teléfono: <%= doctor.getPhoneNumber()%>
                                </p>
                            </a>

                            <%
                                }
                            } else {
                            %>
                            <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-exclamation-circle"></i> No tiene ningún médico asignado</span></h2>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>

    </body>
</html>