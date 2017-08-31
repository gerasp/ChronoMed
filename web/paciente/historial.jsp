<%@page import="data.entities.Medicalhistory"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.MedicalhistoryFacade"%>
<html>
    <%@include file="../head.jsp" %>        
    <body class="body-background">

        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    MedicalhistoryFacade medicalhistoryFacade = FacadeFactory.getFacade("MedicalhistoryFacade");
                    Medicalhistory medicalhistory = medicalhistoryFacade.findByPatient(patient).get(0);
                %>


                <div class="col-md-9">
                    <div class="signin-form-container">
                        <h1 class="text-primary text-center"><small>Historial de</small><br>Sr<% if (patient.getGender().equals("Femenino")) {
                                out.print("a");
                            }%>. <%=patient.getName() + " " + patient.getSurname()%></h1>

                        <blockquote>
                            <footer>Grupo sangu�neo</footer>
                            <p><%=medicalhistory.getBloodType()%></p>
                        </blockquote>
                        <blockquote>
                            <footer>Enfermedades</footer>
                            <p><%=medicalhistory.getPathologies()%></p>
                        </blockquote>
                        <blockquote>
                            <footer>Operaciones</footer>
                            <p><%=medicalhistory.getSurgeries()%></p>
                        </blockquote>

                        <blockquote>
                            <footer>Alergias</footer>
                            <p><%=medicalhistory.getAllergies()%></p>
                        </blockquote>
                        <blockquote>
                            <footer>Historial familiar</footer>
                            <p><%=medicalhistory.getFamilyHistory()%></p>
                        </blockquote>
                        <blockquote>
                            <footer>Otros</footer>
                            <p><%=medicalhistory.getOthers()%></p>
                        </blockquote>
                        <div class="row">
                            <div class="col-md-12" id="print3">
                                <button class="btn btn-primary btn-block" onclick="window.print()">Exportar historial <i class="fa  fa-print"></i>
                                </button><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>

    </body>
</html>