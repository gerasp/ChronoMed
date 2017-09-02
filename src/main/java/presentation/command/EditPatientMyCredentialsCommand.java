package presentation.command;

import data.entities.Patient;
import data.facades.FacadeFactory;
import data.facades.PatientFacade;
import data.facades.UseraccountFacade;

public class EditPatientMyCredentialsCommand extends FrontCommand {

    @Override
    public void process() {
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        UseraccountFacade useraccountFacade = FacadeFactory.getFacade("UseraccountFacade");
        Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));

        if (!request.getParameter("oldPassword").equals(patient.getUserAccountID().getPassword())) {
            request.setAttribute("result",2);
            forward("/patient/data.jsp");
            return;
        }
        if (request.getParameter("email") != null && !request.getParameter("email").trim().isEmpty()) {
            patient.getUserAccountID().setEmail(request.getParameter("email"));
        }
        if (request.getParameter("newPassword") != null && !request.getParameter("newPassword").trim().isEmpty()) {
            patient.getUserAccountID().setPassword(request.getParameter("newPassword"));
        }

        useraccountFacade.edit(patient.getUserAccountID());
        request.getSession().setAttribute("user", patient);

        request.setAttribute("result",1);
        forward("/patient/history.jsp");
    }

}
