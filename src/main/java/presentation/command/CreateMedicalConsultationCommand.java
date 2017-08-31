/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import data.entities.Doctor;
import data.entities.Medicalconsultation;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.FacadeFactory;
import data.facades.MedicalconsultationFacade;
import data.facades.PatientFacade;
import java.util.Date;

/**
 *
 * @author Adrian
 */
public class CreateMedicalConsultationCommand extends FrontCommand{

    @Override
    public void process() {
        MedicalconsultationFacade medicalconsultationFacade = FacadeFactory.getFacade("MedicalconsultationFacade");
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");

        Medicalconsultation medicalconsultation = new Medicalconsultation();
        medicalconsultation.setDate(new Date());
        medicalconsultation.setSymptoms(request.getParameter("symptoms"));
        medicalconsultation.setTreatment(request.getParameter("treatment"));
        medicalconsultation.setRecomendations(request.getParameter("recomendations"));
        medicalconsultation.setExaminations(request.getParameter("examinations"));
        medicalconsultation.setDoctorID(doctor);
        medicalconsultation.setPatientID(patient);
        
        medicalconsultationFacade.create(medicalconsultation);
        request.setAttribute("message", "Consulta añadida cambiado correctamente.");

        forward("/medico/vistapacientescitas.jsp?id=" + request.getParameter("id"));
    }
    
}
