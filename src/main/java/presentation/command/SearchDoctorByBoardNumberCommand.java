/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import data.entities.Doctor;
import data.facades.AbstractFacade;
import data.facades.DoctorFacade;
import data.facades.FacadeFactory;

import java.util.List;

/**
 *
 * @author Saskia y Gerardo
 */
public class SearchDoctorByBoardNumberCommand extends FrontCommand {
    
    @Override
    public void process() {
        DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
        
        try{
            List<Doctor> doctorList = doctorFacade.findByBoardNumber(request.getParameter("search"));        
            request.setAttribute("doctorList", doctorList);
            forward("/administrative/doctormanagement.jsp");
            
        }catch(NumberFormatException e){
            forward("/administrative/doctormanagement.jsp");
        }
        
    }
}
