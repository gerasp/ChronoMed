<%@page import="data.entities.Doctor"%>
<%@page import="data.facades.DoctorFacade"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="java.util.List"%>
<html>
<%@include file="/head.jsp" %>
    <body class="body-background">
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <div class="col-md-9">
                    <div class="signin-form-container">
                        <div class="list-group">
                            <% 
                                DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
                                List<Doctor> doctorList = doctorFacade.findByPatient(patient);
                                
                                if (doctorList != null && !doctorList.isEmpty()) {
                                for (Doctor doctor : doctorList) {
                            %>
                            <a class="list-group-item">
                                <h4 class="list-group-item-heading"><%= doctor.getName()%> <%= doctor.getSurname()%></h4>
                                <p class="list-group-item-text">
                                    N� colegiado: <%= doctor.getBoardNumber()%> | Especialidad: <%= doctor.getSpeciality() %> | N� tel�fono: <%= doctor.getPhoneNumber()%>
                                </p>
                            </a>

                            <%
                                }
                            } else {
                            %>
                            <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-exclamation-circle"></i> No tiene ning�n m�dico asignado</span></h2>
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