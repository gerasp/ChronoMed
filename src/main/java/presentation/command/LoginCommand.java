/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.command;

import data.entities.Administrative;
import data.entities.Doctor;
import data.entities.Patient;
import data.entities.Useraccount;
import data.facades.*;

import javax.servlet.http.HttpSession;

/**
 *
 * @author oscky
 */
public class LoginCommand extends FrontCommand{

    @Override
    public void process() {
        request.getSession().invalidate();
        UseraccountFacade useraccountFacade = FacadeFactory.getFacade("UseraccountFacade");
        if (useraccountFacade == null) return;
        if (!checkLogin(useraccountFacade))return;
        userRedirect();
    }

    private void userRedirect() throws NumberFormatException {
        Object user = request.getSession().getAttribute("user");
        if (user == null) {
            forward("/");
            return;
        }
        if(user.getClass().equals(Patient.class))
            forward("/patient/history.jsp");
        else if(user.getClass().equals(Doctor.class))
            forward("/doctor/patients.jsp");
        else if(user.getClass().equals(Administrative.class))
            forward("/administrative/patientmanagement.jsp");
        else
            forward("/");
    }

    private boolean checkLogin(UseraccountFacade useraccountFacade) {
        Useraccount account = useraccountFacade.checkLogin(request.getParameter("email"), request.getParameter("password"));
        if (account == null) {
            request.setAttribute("error", 1);
            forward("/");
            return false;
        }
        if (!account.getActive()) {
            request.setAttribute("error", 2);
            forward("/");
            return false;
        }
        createSession(getUserByAccount(account));
        return true;
    }
    
    private Object getUserByAccount(Useraccount account) {
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        if (patientFacade != null) {
            Patient patient = patientFacade.findByAccount(account);
            if (patient!= null) return patient;
        }
        
        AdministrativeFacade administrativeFacade = FacadeFactory.getFacade("AdministrativeFacade");
        if (administrativeFacade != null) {
            Administrative administrative  = administrativeFacade.findByAccount(account);
            if (administrative!= null) return administrative;
        }
        
        DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
        if (doctorFacade != null) {
            Doctor doctor  = doctorFacade.findByAccount(account);
            if (doctor!= null) return doctor;
        }
        
        return null;
    }

    private void createSession(Object user) {
        if (user == null) return ;
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
    }
    
}
