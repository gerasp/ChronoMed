package presentation.command;

import data.entities.Doctor;
import data.facades.AbstractFacade;
import data.facades.DoctorFacade;
import data.facades.UseraccountFacade;

public class EditDoctorUserAccountCommand extends FrontCommand {

    @Override
    public void process() {
        DoctorFacade doctorFacade = AbstractFacade.getFacade("DoctorFacade");
        UseraccountFacade useraccountFacade = AbstractFacade.getFacade("UseraccountFacade");
        Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));

        doctor.getUserAccountID().setEmail(request.getParameter("email"));
        if (request.getParameter("isActivated") == null) {
            doctor.getUserAccountID().setActive(false);
        } else {
            doctor.getUserAccountID().setActive(true);
        }
        useraccountFacade.edit(doctor.getUserAccountID());
        forward("/administrativo/editarmedico.jsp");
    }

}
