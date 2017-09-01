package presentation.command;

import business.utils.Email;
import business.utils.Security;
import data.entities.Doctor;
import data.entities.Useraccount;
import data.facades.DoctorFacade;
import data.facades.FacadeFactory;
import data.facades.UseraccountFacade;

public class RegisterDoctorCommand extends FrontCommand {

    @Override
    public void process() {
        UseraccountFacade uaFacade = FacadeFactory.getFacade("UseraccountFacade");
        Useraccount userAccount = getUserAccount();
        if (uaFacade != null) {
            uaFacade.create(userAccount);
        }
        DoctorFacade dFacade = FacadeFactory.getFacade("DoctorFacade");
        Doctor doctor = getDoctor(userAccount);
        if (dFacade != null) {
            dFacade.create(doctor);
        }
        Email.sendUserAccount(userAccount.getEmail(), userAccount.getPassword(), doctor.getName(), doctor.getSurname());
        forward("/administrative/doctormanagement.jsp");

    }

    private Doctor getDoctor(Useraccount useraccount) throws NumberFormatException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String dni = request.getParameter("nif");
        String gender = request.getParameter("gender");
        String speciality = request.getParameter("speciality");
        String boardNumber = request.getParameter("boardNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        String alternativePhoneNumber = request.getParameter("alternativePhoneNumber");
        Doctor doctor = new Doctor();
        doctor.setName(name);
        doctor.setSurname(surname);
        doctor.setNif(dni);
        doctor.setGender(gender);
        doctor.setSpeciality(speciality);
        doctor.setBoardNumber(boardNumber);
        doctor.setPhoneNumber(phoneNumber);
        doctor.setAlternativePhoneNumber(alternativePhoneNumber);
        doctor.setUserAccountID(useraccount);
        return doctor;
    }

    private Useraccount getUserAccount() {
        String email = request.getParameter("email");
        Useraccount useraccount = new Useraccount();
        useraccount.setEmail(email);
        useraccount.setPassword(Security.generateRandomPassword());
        useraccount.setActive(true);
        return useraccount;
    }
}
