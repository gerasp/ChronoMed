/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import data.entities.Doctor;
import data.entities.DoctorPatient;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.DoctorPatientFacade;
import data.facades.PatientFacade;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saskia y Gerardo
 */
public class SearchMyPatientsByNifCommand extends FrontCommand{
    
    @Override
    public void process() {
        PatientFacade patientFacade = AbstractFacade.getFacade("PatientFacade");
        List<Patient> patients = patientFacade.findByNif(request.getParameter("searchNif"));
        
        Doctor doctor = (Doctor) request.getSession().getAttribute("user");
        List<Patient> filteredPatients = new ArrayList<>();
        for (Patient patient : patients) {
            DoctorPatientFacade doctorPatientFacade = AbstractFacade.getFacade("DoctorPatientFacade");
            DoctorPatient doctorPatient = doctorPatientFacade.findByPatientAndDoctor(patient, doctor);
            if (doctorPatient != null) {
                filteredPatients.add(patient);
            }
        }

        request.setAttribute("patients", filteredPatients);
        forward("/medico/pacientes.jsp");
    }   
    
}
