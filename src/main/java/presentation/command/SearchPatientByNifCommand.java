/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.FacadeFactory;
import data.facades.PatientFacade;
import java.util.List;

/**
 *
 * @author Saskia y Gerardo
 */
public class SearchPatientByNifCommand extends FrontCommand{
    
    @Override
    public void process() {
        
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        List<Patient> patients = patientFacade.findByNif(request.getParameter("searchNif"));
        request.setAttribute("patients", patients);
        forward("/administrative/patientmanagement.jsp");
    }   
    
}
