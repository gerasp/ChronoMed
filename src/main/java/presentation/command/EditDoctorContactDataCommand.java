package presentation.command;

import data.entities.Doctor;
import data.facades.DoctorFacade;
import data.facades.FacadeFactory;

public class EditDoctorContactDataCommand extends FrontCommand {

    @Override
    public void process() {
        DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
        Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));
        doctor.setName(request.getParameter("name"));
        doctor.setSurname(request.getParameter("surname"));
        doctor.setNif(request.getParameter("nif"));
        doctor.setGender(request.getParameter("gender"));
        doctor.setSpeciality(request.getParameter("speciality"));
        doctor.setBoardNumber(request.getParameter("boardNumber"));
        doctor.setPhoneNumber(request.getParameter("phoneNumber"));
        doctor.setAlternativePhoneNumber(request.getParameter("alternativePhoneNumber"));
        doctorFacade.edit(doctor);
        request.setAttribute("result", 1);
        forward("/manager/doctor/management.jsp");
    }
}
