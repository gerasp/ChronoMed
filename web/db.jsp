
<%@page import="business.beans.ServerLifetimeBean"%>
<%@page import="data.entities.Medicalconsultation"%>
<%@page import="data.entities.Medicalhistory"%>
<%@page import="data.entities.DoctorPatient"%>
<%@page import="data.entities.Healthcard"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.entities.Patient"%>
<%@page import="data.entities.Doctor"%>
<%@page import="data.entities.Administrative"%>
<%--
    Document   : db
    Created on : 28-mar-2017, 14:02:32
    Author     : Adrian
--%>

<%@page import="java.util.List"%>
<%@page import="data.entities.Useraccount"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="data.facades.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="static javax.rmi.PortableRemoteObject.narrow" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB ChronoMed</title>
    </head>
    <body>
        <h1>El servidor lleva funcionando
        <%

            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)
                    envCtx.lookup("jdbc/chronomed");

            Connection conn = ds.getConnection();

            ServerLifetimeBean serverLifetimeBean = (ServerLifetimeBean) envCtx.lookup("ServerLifetimeBean");
            out.print(serverLifetimeBean.getTime());
        %>
        minutos</h1>
        <hr/>

        <h1 style="margin-bottom:0;">Base de datos: ChronoMed</h1>

        <h1 style="margin-bottom:0;">userAccount</h1>
        <table>
            <tr>
                <th>id</th>
                <th>email</th>
                <th>password</th>
                <th>active</th>
            </tr>
            <%

//                UseraccountFacade uaFacade = FacadeFactory.getFacade("Useraccount");
                UseraccountFacade uaFacade = (UseraccountFacade) envCtx.lookup("UseraccountFacade");
                List<Useraccount> userAccounts = uaFacade.findAll();

                for (Useraccount userAccount : userAccounts) {
                    out.println(
                            "<tr>"
                            + "<td>" + userAccount.getId() + "</td>"
                            + "<td>" + userAccount.getEmail() + "</td>"
                            + "<td>" + userAccount.getPassword() + "</td>"
                            + "<td>" + userAccount.getActive() + "</td>"
                            + "</tr>"
                    );
                }
            %>
        </table>

        <%--<h1 style="margin-bottom:0;">administrative</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>name</th>--%>
                <%--<th>surname</th>--%>
                <%--<th>nif</th>--%>
                <%--<th>userAccount</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--AdministrativeFacade aFacade = FacadeFactory.getFacade("AdministrativeFacade");--%>
                <%--List<Administrative> administratives = aFacade.findAll();--%>
                <%--for (Administrative administrative : administratives) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + administrative.getId() + "</td>"--%>
                            <%--+ "<td>" + administrative.getName() + "</td>"--%>
                            <%--+ "<td>" + administrative.getSurname() + "</td>"--%>
                            <%--+ "<td>" + administrative.getNif() + "</td>"--%>
                            <%--+ "<td>" + administrative.getUserAccountID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

        <%--<h1 style="margin-bottom:0;">doctor</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>boardNumber</th>--%>
                <%--<th>name</th>--%>
                <%--<th>surname</th>--%>
                <%--<th>gender</th>--%>
                <%--<th>phoneNumber</th>--%>
                <%--<th>alternativePhoneNumber</th>--%>
                <%--<th>speciality</th>--%>
                <%--<th>nif</th>--%>
                <%--<th>userAccount</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--DoctorFacade dFacade = FacadeFactory.getFacade("DoctorFacade");--%>
                <%--List<Doctor> doctors = dFacade.findAll();--%>
                <%--for (Doctor doctor : doctors) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + doctor.getId() + "</td>"--%>
                            <%--+ "<td>" + doctor.getBoardNumber() + "</td>"--%>
                            <%--+ "<td>" + doctor.getName() + "</td>"--%>
                            <%--+ "<td>" + doctor.getSurname() + "</td>"--%>
                            <%--+ "<td>" + doctor.getGender() + "</td>"--%>
                            <%--+ "<td>" + doctor.getPhoneNumber() + "</td>"--%>
                            <%--+ "<td>" + doctor.getAlternativePhoneNumber() + "</td>"--%>
                            <%--+ "<td>" + doctor.getSpeciality() + "</td>"--%>
                            <%--+ "<td>" + doctor.getNif() + "</td>"--%>
                            <%--+ "<td>" + doctor.getUserAccountID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

        <%--<h1 style="margin-bottom:0;">doctor_patient</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>doctor</th>--%>
                <%--<th>patient</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--DoctorPatientFacade dpFacade = FacadeFactory.getFacade("DoctorPatientFacade");--%>
                <%--List<DoctorPatient> doctorPatients = dpFacade.findAll();--%>
                <%--for (DoctorPatient doctorPatient : doctorPatients) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + doctorPatient.getId() + "</td>"--%>
                            <%--+ "<td>" + doctorPatient.getDoctorID().getId()+ "</td>"--%>
                            <%--+ "<td>" + doctorPatient.getPatientID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

        <%--<h1 style="margin-bottom:0;">patient</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>name</th>--%>
                <%--<th>surname</th>--%>
                <%--<th>gender</th>--%>
                <%--<th>address</th>--%>
                <%--<th>locality</th>--%>
                <%--<th>zipCode</th>--%>
                <%--<th>province</th>--%>
                <%--<th>country</th>--%>
                <%--<th>phoneNumber</th>--%>
                <%--<th>AlternativePhoneNumber</th>--%>
                <%--<th>birthDate</th>--%>
                <%--<th>nif</th>--%>
                <%--<th>nationality</th>--%>
                <%--<th>userAccount</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--PatientFacade pFacade = FacadeFactory.getFacade("PatientFacade");--%>
                <%--List<Patient> patients = pFacade.findAll();--%>
                <%--for (Patient patient : patients) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + patient.getId() + "</td>"--%>
                            <%--+ "<td>" + patient.getName() + "</td>"--%>
                            <%--+ "<td>" + patient.getSurname() + "</td>"--%>
                            <%--+ "<td>" + patient.getGender() + "</td>"--%>
                            <%--+ "<td>" + patient.getAddress() + "</td>"--%>
                            <%--+ "<td>" + patient.getLocality() + "</td>"--%>
                            <%--+ "<td>" + patient.getZipCode() + "</td>"--%>
                            <%--+ "<td>" + patient.getProvince() + "</td>"--%>
                            <%--+ "<td>" + patient.getCountry() + "</td>"--%>
                            <%--+ "<td>" + patient.getPhoneNumber() + "</td>"--%>
                            <%--+ "<td>" + patient.getAlternativePhoneNumber() + "</td>"--%>
                            <%--+ "<td>" + new SimpleDateFormat("dd/MM/yyyy").format(patient.getBirthDate()) + "</td>"--%>
                            <%--+ "<td>" + patient.getNif() + "</td>"--%>
                            <%--+ "<td>" + patient.getNationality() + "</td>"--%>
                            <%--+ "<td>" + patient.getUserAccountID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

        <%--<h1 style="margin-bottom:0;">healthCard</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>number</th>--%>
                <%--<th>patient</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--HealthcardFacade hcFacade = FacadeFactory.getFacade("HealthcardFacade");--%>
                <%--List<Healthcard> healthcards = hcFacade.findAll();--%>
                <%--for (Healthcard healthcard : healthcards) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + healthcard.getId() + "</td>"--%>
                            <%--+ "<td>" + healthcard.getNumber() + "</td>"--%>
                            <%--+ "<td>" + healthcard.getPatientID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

        <%--<h1 style="margin-bottom:0;">medicalhistory</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>bloodtype</th>--%>
                <%--<th>familyHistory</th>--%>
                <%--<th>allergies</th>--%>
                <%--<th>pathologies</th>--%>
                <%--<th>surgeries</th>--%>
                <%--<th>others</th>--%>
                <%--<th>patientID</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--MedicalhistoryFacade mhFacade = FacadeFactory.getFacade("MedicalhistoryFacade");--%>
                <%--List<Medicalhistory> medicalhistories = mhFacade.findAll();--%>
                <%--for (Medicalhistory medicalhistory : medicalhistories) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + medicalhistory.getId() + "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getBloodType()+ "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getFamilyHistory()+ "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getAllergies()+ "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getPathologies()+ "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getSurgeries()+ "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getOthers()+ "</td>"--%>
                            <%--+ "<td>" + medicalhistory.getPatientID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>


        <%--<h1 style="margin-bottom:0;">medicalconsultation</h1>--%>
        <%--<table>--%>
            <%--<tr>--%>
             <%--<th>id</th>--%>
                <%--<th>date</th>--%>
                <%--<th>symptoms</th>--%>
                <%--<th>treatment</th>--%>
                <%--<th>recomendations</th>--%>
                <%--<th>examinations</th>--%>
                <%--<th>doctorID</th>--%>
                <%--<th>patientID</th>--%>
            <%--</tr>--%>
            <%--<%--%>
                <%--MedicalconsultationFacade mcFacade = FacadeFactory.getFacade("MedicalconsultationFacade");--%>
                <%--List<Medicalconsultation> medicalconsultations = mcFacade.findAll();--%>
                <%--for (Medicalconsultation medicalconsultation : medicalconsultations) {--%>
                    <%--out.println(--%>
                            <%--"<tr>"--%>
                            <%--+ "<td>" + medicalconsultation.getId() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getDate() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getSymptoms() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getTreatment() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getRecomendations() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getExaminations() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getDoctorID().getId() + "</td>"--%>
                            <%--+ "<td>" + medicalconsultation.getPatientID().getId() + "</td>"--%>
                            <%--+ "</tr>"--%>
                    <%--);--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

    </body>
</html>
