/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import data.entities.Doctor;
import data.entities.DoctorPatient;
import data.entities.Healthcard;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.DoctorPatientFacade;
import data.facades.FacadeFactory;
import data.facades.HealthcardFacade;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saskia y Gerardo
 */
public class SearchMyPatientsByHealthcardCommand extends FrontCommand {

    @Override
    public void process() {
        HealthcardFacade healthcardFacade = FacadeFactory.getFacade("HealthcardFacade");
        List<Healthcard> healthcards = healthcardFacade.findHealthCardByHealthCardNumber(request.getParameter("searchHealthCardNumber"));
        List<Patient> patients = new ArrayList<>();
        if (healthcards == null) {
            healthcards = new ArrayList<>();
        }
        for (Healthcard healthcard : healthcards) {
            patients.add(healthcard.getPatientID());
        }

        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
        List<Patient> filteredPatients = new ArrayList<>();
        for (Patient patient : patients) {
            DoctorPatientFacade doctorPatientFacade = FacadeFactory.getFacade("DoctorPatientFacade");
            DoctorPatient doctorPatient = doctorPatientFacade.findByPatientAndDoctor(patient, doctor);
            if (doctorPatient != null) {
                filteredPatients.add(patient);
            }
        }

        request.setAttribute("healthcardPatients", filteredPatients);
        forward("/doctor/patients.jsp");
    }

}
