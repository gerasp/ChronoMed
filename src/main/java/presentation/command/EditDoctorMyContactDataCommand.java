package presentation.command;

import data.entities.Doctor;
import data.facades.DoctorFacade;
import data.facades.FacadeFactory;

public class EditDoctorMyContactDataCommand extends FrontCommand {

    @Override
    public void process() {
        DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
        Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));
        
        doctor.setAlternativePhoneNumber(request.getParameter("alternativePhoneNumber"));
        doctor.setPhoneNumber(request.getParameter("phoneNumber"));

        doctorFacade.edit(doctor);
        request.getSession().setAttribute("user", doctor);
        request.setAttribute("message", "Datos cambiados correctamente.");

        forward("/doctor/data.jsp");
    }

}
