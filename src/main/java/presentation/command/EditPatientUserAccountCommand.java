package presentation.command;

import business.utils.Email;
import data.entities.Administrative;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.FacadeFactory;
import data.facades.PatientFacade;
import data.facades.UseraccountFacade;

public class EditPatientUserAccountCommand extends FrontCommand {

    @Override
    public void process() {
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        UseraccountFacade useraccountFacade = FacadeFactory.getFacade("UseraccountFacade");
        Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
       
        patient.getUserAccountID().setEmail(request.getParameter("email"));
        if (request.getParameter("isActivated") == null) {
            patient.getUserAccountID().setActive(false);
        } else {
            patient.getUserAccountID().setActive(true);
        }
        
        patientFacade.edit(patient);
        useraccountFacade.edit(patient.getUserAccountID());
        
        Administrative session = (Administrative) request.getSession().getAttribute("user");
        Email.sendNotification(session.getSurname() +", " + session.getName() + " (" + session.getNif()+ ")" , "una modificación en los datos de acceso", patient.getUserAccountID().getEmail());
        forward("/administrativo/editarpaciente.jsp");
    }
}
