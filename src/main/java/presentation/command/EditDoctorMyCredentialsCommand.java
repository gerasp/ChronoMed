package presentation.command;

import data.entities.Doctor;
import data.facades.AbstractFacade;
import data.facades.DoctorFacade;
import data.facades.UseraccountFacade;

public class EditDoctorMyCredentialsCommand extends FrontCommand {

    @Override
    public void process() {
        DoctorFacade doctorFacade = AbstractFacade.getFacade("DoctorFacade");
        UseraccountFacade useraccountFacade = AbstractFacade.getFacade("UseraccountFacade");
        Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));

        if (!request.getParameter("oldPassword").equals(doctor.getUserAccountID().getPassword())) {
            request.setAttribute("message", "Contraseña inválida. No se ha hecho ningún cambio.");
            forward("/medico/datos.jsp");
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
        request.setAttribute("message", "Datos cambiados correctamente.");

        forward("/medico/datos.jsp");
    }

}
