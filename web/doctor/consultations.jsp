<%@ page import="data.entities.Medicalconsultation" %>
<%@ page import="data.facades.MedicalconsultationFacade" %>
<div class="bordered-folder" id="consultations" style="display: none">
    <%
        MedicalconsultationFacade medicalconsultationFacade = FacadeFactory.getFacade("MedicalconsultationFacade");
        List<Medicalconsultation> medicalconsultationList = medicalconsultationFacade.findByPatient(patient);
    %>
    <div class="form-inline text-center">
        <h3><fmt:message key="action.filter.title"/></h3>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><fmt:message key="consultation.from"/></div>
                <input id="from_date" type="date" name="from" class="form-control" required value="">

                <div class="input-group-addon"><fmt:message key="consultation.to"/></div>
                <input id="to_date" type="date" name="to" class="form-control" required value="">
            </div>
        </div>
        <button onclick="filter()" class="btn btn-primary"><fmt:message key="action.filter"/></button>
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
                    <h4 class="timeline-title">Dr<%
                        if (medicalconsultation.getDoctorID().getGender().equals("Femenino")) {
                            out.print("a");
                        }%>. <%=medicalconsultation.getDoctorID().getName()%>
                    </h4>
                    <p>
                        <small class="text-muted a_date"><i class="fa fa-clock-o"></i>
                            <time datetime="<%=new SimpleDateFormat("yyyy-MM-dd").format(medicalconsultation.getDate())%>"><%=new SimpleDateFormat("dd/MM/yyyy").format(medicalconsultation.getDate())%>
                            </time>
                        </small>
                    </p>
                </div>
                <div class="timeline-body">
                    <p>
                        <b><fmt:message key="consultation.symptoms"/></b>: <%=medicalconsultation.getSymptoms()%><br>
                        <b><fmt:message
                                key="consultation.examinations"/></b>: <%=medicalconsultation.getExaminations()%><br>
                        <b><fmt:message key="consultation.treatment"/></b>: <%=medicalconsultation.getTreatment()%><br>
                        <b><fmt:message
                                key="consultation.recomendations"/></b>: <%=medicalconsultation.getRecomendations()%>
                    </p>
                </div>
            </div>
        </li>
        <%
                }
            }%>
    </ul>
    <div class="row" style="margin:10px;">
        <div class="col-md-6">
            <button class="btn btn-primary btn-block" onclick="window.print()">Exportar citas <i
                    class="fa  fa-print"></i>
            </button>
        </div>
        <div class="col-md-6">
            <button id="openModal2Button" class="btn btn-primary btn-block">A�adir cita <i
                    class="fa  fa-plus-circle"></i>
            </button>
        </div>
    </div>
</div>
<%@include file="/doctor/consultation.jsp" %>
