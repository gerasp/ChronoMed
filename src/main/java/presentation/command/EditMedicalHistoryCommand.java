/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import business.utils.Email;
import data.entities.Doctor;
import data.entities.Medicalhistory;
import data.entities.Patient;
import data.facades.FacadeFactory;
import data.facades.MedicalhistoryFacade;
import data.facades.PatientFacade;

/**
 *
 * @author Adrian
 */
public class EditMedicalHistoryCommand extends FrontCommand {

    @Override
    public void process() {
        MedicalhistoryFacade medicalhistoryFacade = FacadeFactory.getFacade("MedicalhistoryFacade");
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
        Medicalhistory medicalhistory = medicalhistoryFacade.findByPatient(patient).get(0);

        medicalhistory.setBloodType(request.getParameter("bloodType"));
        medicalhistory.setPathologies(request.getParameter("pathologies"));
        medicalhistory.setSurgeries(request.getParameter("surgeries"));
        medicalhistory.setAllergies(request.getParameter("allergies"));
        medicalhistory.setFamilyHistory(request.getParameter("familyHistory"));
        medicalhistory.setOthers(request.getParameter("others"));

        medicalhistoryFacade.edit(medicalhistory);
        Doctor doctor1 = (Doctor) request.getSession().getAttribute("user");
        Email.sendNotification(doctor1.getSurname() +", " + doctor1.getName() + " (" + doctor1.getBoardNumber() + ")" , "una modificación en su historial médico", patient.getUserAccountID().getEmail());
        request.setAttribute("result", 1);
        forward("/doctor/patients");
    }

}
