<%@page import="data.entities.Medicalconsultation"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.MedicalconsultationFacade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<html>
    <%@include file="../head.jsp" %>
    <script src="/js/utils.js"></script>
    <body class="body-background">
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    MedicalconsultationFacade medicalconsultationFacade = FacadeFactory.getFacade("MedicalconsultationFacade");
                    List<Medicalconsultation> medicalconsultationList = medicalconsultationFacade.findByPatient(patient);
                %>
                <div class="col-md-9">
                    <div class="signin-form-container">
                        <div class="form-inline text-center" >
                            <h3 id="print1">Filtrar por rango de fechas</h3>
                            <div class="form-group">
                                <div class="input-group" id="print2">
                                    <div class="input-group-addon">Desde</div>
                                    <input id="from_date" type="date" name="from" class="form-control" required value="">

                                    <div class="input-group-addon">hasta</div>
                                    <input id="to_date" type="date" name="to" class="form-control" required value="">
                                </div>
                            </div>
                            <button onclick="filter()" class="btn btn-primary" id="print4">Filtrar</button>
                        </div>
                        <% if (medicalconsultationList != null && !medicalconsultationList.isEmpty()) {%>

                        <ul class="timeline">
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
                                            <b>Pruebas</b>: <%=medicalconsultation.getExaminations()%><br>
                                            <b>Tratamiento</b>: <%=medicalconsultation.getTreatment()%><br>
                                            <b>Recomendaciones</b>: <%=medicalconsultation.getRecomendations()%><br>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <%
                                    }
                                }%>
                        </ul>
                        <button class="btn btn-primary btn-block" onclick="window.print()" id="print3">Exportar historial <i class="fa  fa-print"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>

    </body>
</html>