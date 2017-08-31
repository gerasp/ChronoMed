<%@page import="business.utils.Email"%>
<%@page import="data.entities.Medicalhistory"%>
<%@page import="data.entities.Patient"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.MedicalhistoryFacade"%>
<%@page import="data.facades.PatientFacade"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
    <%@include file="../head.jsp" %>        
    <body class="body-background">
        <style>
            textarea {
                resize:none;
                width: 100%;
            }
        </style>
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
                    Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
                    Doctor doctor1 = (Doctor) request.getSession().getAttribute("user");
                    Email.sendNotification(doctor1.getSurname() +", " + doctor1.getName() + " (" + doctor1.getBoardNumber() + ")" , "una visita a su historial", patient.getUserAccountID().getEmail());
                %>

                <div class="col-md-9">
                    <div class="signin-form-container">
                        <div class="row">
                            <div class="col-md-2" id="print5">
                                <a href="/medico/pacientes.jsp" class="btn btn-block btn-lg btn-link "><i class="fa fa-arrow-circle-left"></i> Atr�s</a>
                            </div>
                            <div class="col-md-8">
                                <h1 class="form-title text-center">Sr<% if (patient.getGender().equals("a")) {

                                        out.println("a");
                                    }%>. <%= patient.getName()%> <%=patient.getSurname()%></h1>

                            </div>
                        </div>
                        <blockquote>
                            <footer>Ficha</footer>
                            <p>Paciente de g�nero <%=patient.getGender().toLowerCase()%> y nacionalidad <%= patient.getNationality()%>, <br>nacido el <%=new SimpleDateFormat("dd/MM/yyyy").format(patient.getBirthDate())%></p>
                        </blockquote>
                        <ul class="nav nav-justified nav-tabs" style="margin-top: 20px;">
                            <li  class="active">
                                <a href="/medico/vistapacienteshistorial.jsp?id=<%= patient.getId()%>"><i class="fa fa-lg fa-heartbeat"></i> Historial</a>
                            </li>
                            <li>
                                <a href="/medico/vistapacientescitas.jsp?id=<%= patient.getId()%>"><i class="fa fa-lg fa-calendar"></i> Citas</a>
                            </li>
                        </ul>
                        <div class="bordered-folder">
                            <form class="form-vertical" method="POST" role="form" action="/FrontController">
                                <input type="hidden" value="EditMedicalHistoryCommand" name="command">
                                <input type="hidden" value="<%= patient.getId()%>" name="id">
                                <%
                                    MedicalhistoryFacade medicalhistoryFacade = FacadeFactory.getFacade("MedicalhistoryFacade");
                                    Medicalhistory medicalhistory = medicalhistoryFacade.findByPatient(patient).get(0);
                                %>
                                <h5 style="margin-left:10px; margin-bottom: 10px;" class="text-muted text-center" id="print6"><i class="fa fa-question-circle"></i> Puede editar los campos clicando sobre ellos y luego haciendo click en "Guardar cambios"</h5>
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td><strong>Grupo sangu�neo</strong></td>
                                            <td><input required class="input-in-table" type="text" name="bloodType" value="<%=medicalhistory.getBloodType()%>"></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Enfermedades</strong></td>
                                            <td><textarea required rows="4" cols="50" name="pathologies"><%=medicalhistory.getPathologies()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Operaciones</strong></td>
                                            <td><textarea required rows="4" cols="50" name="surgeries"><%=medicalhistory.getSurgeries()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Alergias</strong></td>
                                            <td><textarea required rows="4" cols="50" name="allergies"><%=medicalhistory.getAllergies()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Historial familiar</strong></td>
                                            <td><textarea required rows="4" cols="50" name="familyHistory"><%=medicalhistory.getFamilyHistory()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Otros</strong></td>
                                            <td><textarea required rows="4" cols="50" name="others"><%=medicalhistory.getOthers()%></textarea></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="row" style="margin:10px;">
                                    <div class="col-md-6" id="print3">

                                        <button class="btn btn-primary btn-block" onclick="window.print()">Exportar historial <i class="fa  fa-print"></i>
                                        </button><br>
                                    </div>
                                    <div class="col-md-6" id="print4">
                                        <button type="submit" class="btn btn-primary btn-block">Guardar cambios <i class="fa  fa-save"></i>
                                        </button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>