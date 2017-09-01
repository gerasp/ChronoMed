<%@page import="business.utils.Email" %>
<%@page import="data.entities.Doctor" %>
<%@page import="data.entities.Medicalconsultation" %>
<%@page import="data.entities.Medicalhistory" %>
<%@page import="data.facades.FacadeFactory" %>
<%@page import="data.facades.MedicalconsultationFacade" %>
<%@page import="data.facades.MedicalhistoryFacade" %>
<%@ page import="data.facades.PatientFacade" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>

<%
    PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
    Doctor doctor1 = (Doctor) request.getSession().getAttribute("user");
    Email.sendNotification(doctor1.getSurname() + ", " + doctor1.getName() + " (" + doctor1.getBoardNumber() + ")", "una visita a su historial", patient.getUserAccountID().getEmail());
%>

<br><br>
<h1 class="form-title text-center">Sr<% if (patient.getGender().equals("a")) {

    out.println("a");
}%>. <%= patient.getName()%> <%=patient.getSurname()%>
</h1>

<blockquote>
    <footer>Ficha</footer>
    <p>Paciente de g�nero <%=patient.getGender().toLowerCase()%> y nacionalidad <%= patient.getNationality()%>,
        <br>nacido el <%=new SimpleDateFormat("dd/MM/yyyy").format(patient.getBirthDate())%>
    </p>
</blockquote>
<ul class="nav nav-justified nav-tabs" style="margin-top: 20px;">
    <li class="active" id="history-tab"><a href="#"><i class="fa fa-lg fa-heartbeat"></i> Historial</a></li>
    <li id="consultations-tab"><a href="#"><i class="fa fa-lg fa-calendar"></i> Citas</a></li>
</ul>
<%@include file="/doctor/history.jsp" %>
<%@include file="/doctor/consultations.jsp" %>

<script>
    $("#history-tab").click(function () {
        $("#consultations-tab").removeClass("active");
        $("#history-tab").addClass("active");
        $("#history").show();
        $("#consultations").hide();
    });
    $("#consultations-tab").click(function () {
        $("#consultations-tab").addClass("active");
        $("#history-tab").removeClass("active");
        $("#history").hide();
        $("#consultations").show();
    });
</script>