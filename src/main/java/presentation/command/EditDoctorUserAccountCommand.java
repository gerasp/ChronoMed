package presentation.command;

import data.entities.Doctor;
import data.facades.DoctorFacade;
import data.facades.FacadeFactory;
import data.facades.UseraccountFacade;

public class EditDoctorUserAccountCommand extends FrontCommand {

    @Override
    public void process() {
        DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
        UseraccountFacade useraccountFacade = FacadeFactory.getFacade("UseraccountFacade");
        Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));

        doctor.getUserAccountID().setEmail(request.getParameter("email"));
        if (request.getParameter("isActivated") == null) {
            doctor.getUserAccountID().setActive(false);
        } else {
            doctor.getUserAccountID().setActive(true);
        }
        useraccountFacade.edit(doctor.getUserAccountID());
        request.setAttribute("result", 1);
        forward("/manager/doctor/edit.jsp");
    }

}
