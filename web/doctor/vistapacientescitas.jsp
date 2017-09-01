<%@page import="data.entities.Medicalconsultation"%>
<%@page import="data.entities.Patient"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.MedicalconsultationFacade"%>
<%@page import="data.facades.PatientFacade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List" %>
    <%@include file="/header.jsp" %>
    <style>
        textarea {
            border: #a9a9a9 1px solid;
            resize: none;
        }
    </style>
    <body class="body-background">
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
                    Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
                %>

                <div class="col-md-9">
                    <div class="signin-form-container">
                        <div class="row">
                            <div class="col-md-2" id="print1">
                                <a href="/doctor/patients.jsp" class="btn btn-block btn-lg btn-link "><i class="fa fa-arrow-circle-left"></i>&nbsp<fmt:message key="form.back" /></a>
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
                            <li>
                                <a href="/doctor/vistapacienteshistory.jsp?id=<%= patient.getId()%>"><i class="fa fa-lg fa-heartbeat"></i> Historial</a>
                            </li>
                            <li  class="active">
                                <a href="/doctor/vistapacientesconsultations.jsp?id=<%= patient.getId()%>"><i class="fa fa-lg fa-calendar"></i> Citas</a>
                            </li>
                        </ul>
                        <div class="bordered-folder">
                            <%
                                MedicalconsultationFacade medicalconsultationFacade = FacadeFactory.getFacade("MedicalconsultationFacade");
                                List<Medicalconsultation> medicalconsultationList = medicalconsultationFacade.findByPatient(patient);
                            %>

                            <div class="form-inline text-center" >
                                <h3 id="print2">Filtrar por rango de fechas</h3>
                                <div class="form-group" id="print5">
                                    <div class="input-group">
                                        <div class="input-group-addon">Desde</div>
                                        <input id="from_date" type="date" name="from" class="form-control" required value="">

                                        <div class="input-group-addon">hasta</div>
                                        <input id="to_date" type="date" name="to" class="form-control" required value="">
                                    </div>
                                </div>
                                <button onclick="filter()" class="btn btn-primary" id="print6">Filtrar</button>
                            </div>
                            <% if (medicalconsultationList != null && !medicalconsultationList.isEmpty()) {%>

                            <ul class="timeline" style="margin-right:20px;">
                                <%

                                    for (Medicalconsultation medicalconsultation : medicalconsultationList) {
                                %>
                                <li>
                                    <div class="timeline-badge primary"><i class="fa fa-lg fa-hospital-o"></i></div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Dr<% if (medicalconsultation.getDoctorID().getGender().equals("Femenino")) {
                                                    out.print("a");
                                                }%>. <%=medicalconsultation.getDoctorID().getName()%></h4>
                                            <p><small class="text-muted a_date"><i class="fa fa-clock-o"></i><time datetime="<%=new SimpleDateFormat("yyyy-MM-dd").format(medicalconsultation.getDate())%>"><%=new SimpleDateFormat("dd/MM/yyyy").format(medicalconsultation.getDate())%></time></small></p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>
                                                <b>S�ntomas</b>: <%=medicalconsultation.getSymptoms()%><br>
                                                <b>Recomendaciones</b>: <%=medicalconsultation.getRecomendations()%><br>
                                                <b>Tratamiento</b>: <%=medicalconsultation.getTreatment()%><br>
                                                <b>Pruebas</b>: <%=medicalconsultation.getExaminations()%><br>
                                            </p>
                                        </div>
                                    </div>
                                </li>

                                <%
                                        }
                                    }%>

                            </ul>
                            <div class="row" style="margin:10px;">
                                <div class="col-md-6" id="print3">
                                    <button class="btn btn-primary btn-block" onclick="window.print()">Exportar citas <i class="fa  fa-print"></i>
                                    </button><br>
                                </div>
                                <div class="col-md-6" id="print4">
                                    <button id="openModal2Button" class="btn btn-primary btn-block">A�adir cita <i class="fa  fa-plus-circle"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-plus-circle"></i> Añadir cita</h4>
                    </div>
                    <form class="form-vertical" method="POST" role="form" action="/FrontController">
                        <input type="hidden" value="CreateMedicalConsultationCommand" name="command">
                        <input type="hidden" value="<%= patient.getId()%>" name="id">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <td><strong>S�ntomas</strong></td>
                                    <td><textarea rows="4" cols="40" required class="input-in-table" name="symptoms"></textarea></td>
                                </tr>
                                <tr>
                                    <td><strong>Pruebas</strong></td>
                                    <td><textarea rows="4" cols="40" required class="input-in-table" name="examinations"></textarea></td>
                                </tr>
                                <tr>
                                    <td><strong>Tratamiento</strong></td>
                                    <td><textarea rows="4" cols="40" required class="input-in-table" name="treatment"></textarea></td>
                                </tr>
                                <tr>
                                    <td><strong>Recomendaciones</strong></td>
                                    <td><textarea rows="4" cols="40" required class="input-in-table" name="recomendations"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="row" style="margin:10px;">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary btn-block">A�adir cita <i class="fa  fa-plus-circle"></i>
                                </button>
                            </div>
                        </div>

                    </form>
                </div>

            </div>
        </div>
        <script>

            $("#openModal2Button").click(function () {
                $("#myModal2").modal("show")
            });
        </script>
        <%@include file="/footer.jsp" %>

    </body>
</html>