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
import data.facades.AbstractFacade;
import data.facades.AdministrativeFacade;
import data.facades.DoctorFacade;
import data.facades.PatientFacade;
import data.facades.UseraccountFacade;
import javax.servlet.http.HttpSession;

/**
 *
 * @author oscky
 */
public class LoginCommand extends FrontCommand{

    @Override
    public void process() {
        request.getSession().invalidate();
        UseraccountFacade useraccountFacade = AbstractFacade.getFacade("UseraccountFacade");
        if (useraccountFacade == null) return;
        if (!checkLogin(useraccountFacade))return;
        userRedirect();
    }

    private void userRedirect() throws NumberFormatException {
        Object user = request.getSession().getAttribute("user");
               
        if(user.getClass().equals(Patient.class))
            forward("/paciente/historial.jsp");
        else if(user.getClass().equals(Doctor.class))
            forward("/medico/pacientes.jsp");
        else if(user.getClass().equals(Administrative.class))
            forward("/administrativo/gestiondepacientes.jsp");
        else
            forward("/index.jsp");
    }

    private boolean checkLogin(UseraccountFacade useraccountFacade) {
        Useraccount account = useraccountFacade.checkLogin(request.getParameter("email"), request.getParameter("password"));
        if (account == null) {
            request.setAttribute("error", "Credenciales inválidas");
            forward("/index.jsp");
            return false;
        }
        if (!account.getActive()) {
            request.setAttribute("error", "Su cuenta ha sido desactivada, contacte con su centro");
            forward("/index.jsp");
            return false;
        }
        createSession(getUserByAccount(account));
        return true;
    }
    
    private Object getUserByAccount(Useraccount account) {
        PatientFacade patientFacade = AbstractFacade.getFacade("PatientFacade");
        if (patientFacade != null) {
            Patient patient = patientFacade.findByAccount(account);
            if (patient!= null) return patient;
        }
        
        AdministrativeFacade administrativeFacade = AbstractFacade.getFacade("AdministrativeFacade");
        if (administrativeFacade != null) {
            Administrative administrative  = administrativeFacade.findByAccount(account);
            if (administrative!= null) return administrative;
        }
        
        DoctorFacade doctorFacade = AbstractFacade.getFacade("DoctorFacade");
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
