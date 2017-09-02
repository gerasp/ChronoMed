package presentation.command;

import data.entities.Doctor;
import data.facades.DoctorFacade;
import data.facades.FacadeFactory;
import data.facades.UseraccountFacade;

public class EditDoctorMyCredentialsCommand extends FrontCommand {

    @Override
    public void process() {
        DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
        UseraccountFacade useraccountFacade = FacadeFactory.getFacade("UseraccountFacade");
        Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));

        if (!request.getParameter("oldPassword").equals(doctor.getUserAccountID().getPassword())) {
            request.setAttribute("result",2);
            forward("/doctor/data.jsp");
            return;
        }
        if (request.getParameter("email") != null && !request.getParameter("email").trim().isEmpty()) {
            doctor.getUserAccountID().setEmail(request.getParameter("email"));
        }
        if (request.getParameter("newPassword") != null && !request.getParameter("newPassword").trim().isEmpty()) {
            doctor.getUserAccountID().setPassword(request.getParameter("newPassword"));
        }

        useraccountFacade.edit(doctor.getUserAccountID());
        request.getSession().setAttribute("user", doctor);
        request.setAttribute("result",1);
        forward("/doctor/data.jsp");
    }

}
