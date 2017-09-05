<%@page import="data.entities.Medicalconsultation"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.MedicalconsultationFacade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
    <%@include file="header.jsp" %>
    <body class="body-grey">
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    MedicalconsultationFacade medicalconsultationFacade = FacadeFactory.getFacade("MedicalconsultationFacade");
                    List<Medicalconsultation> medicalconsultationList = medicalconsultationFacade.findByPatient(patient);
                %>
                <div class="col-md-9 print">
                    <div class="white-container">
                        <div class="form-inline text-center" >
                            <h3><fmt:message key="action.filter.title" /></h3>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon"><fmt:message key="consultation.from" /></div>
                                    <input id="from_date" type="date" name="from" class="form-control" required value="">
                                    <div class="input-group-addon"><fmt:message key="consultation.to" /></div>
                                    <input id="to_date" type="date" name="to" class="form-control" required value="">
                                </div>
                            </div>
                            <button onclick="filter()" class="btn btn-primary not-print"><fmt:message key="action.filter" /></button>
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
                                        <h4 class="timeline-title"><% if (medicalconsultation.getDoctorID().getGender().equals("Femenino")) { %>
                                            <fmt:message key="navigation.doctor.female"/>
                                            <% } else { %>
                                            <fmt:message key="navigation.doctor.male" />
                                            <% } %>&nbsp;<%=medicalconsultation.getDoctorID().getName()%>
                                        </h4>
                                        <p><small class="text-muted a_date"><i class="fa fa-clock-o"></i>&nbsp;<time datetime="<%=new SimpleDateFormat("yyyy-MM-dd").format(medicalconsultation.getDate())%>"><%=new SimpleDateFormat("dd/MM/yyyy").format(medicalconsultation.getDate())%></time></small></p>
                                    </div>
                                    <div class="timeline-body">
                                        <p>
                                            <b><fmt:message key="consultation.symptoms" /></b>: <%=medicalconsultation.getSymptoms()%><br>
                                            <b><fmt:message key="consultation.examinations" /></b>: <%=medicalconsultation.getExaminations()%><br>
                                            <b><fmt:message key="consultation.treatment" /></b>: <%=medicalconsultation.getTreatment()%><br>
                                            <b><fmt:message key="consultation.recomendations" /></b>: <%=medicalconsultation.getRecomendations()%><br>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <%}%>
                        </ul>
                        <button class="btn btn-primary btn-block not-print" onclick="window.print()"><fmt:message key="action.export" />&nbsp;<i class="fa  fa-print"></i></button>
                        <% } else { %>
                        <br>
                        <div class="well well-lg text-center">
                            <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="search.consultation.notFound"/>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>

    </body>
</html>