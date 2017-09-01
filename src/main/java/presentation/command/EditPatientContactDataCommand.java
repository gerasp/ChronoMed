package presentation.command;

import business.utils.Email;
import data.entities.Administrative;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.FacadeFactory;
import data.facades.PatientFacade;

public class EditPatientContactDataCommand extends FrontCommand {

    @Override
    public void process() {
        PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
        Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
        patient.setAddress(request.getParameter("address"));
        patient.setLocality(request.getParameter("locality"));
        patient.setZipCode(request.getParameter("zipCode"));
        patient.setProvince(request.getParameter("province"));
        patient.setCountry(request.getParameter("country"));
        patient.setPhoneNumber(request.getParameter("phoneNumber"));
        patient.setAlternativePhoneNumber(request.getParameter("alternativePhoneNumber"));
        patientFacade.edit(patient);
        
        Administrative session = (Administrative) request.getSession().getAttribute("user");
        Email.sendNotification(session.getSurname() +", " + session.getName() + " (" + session.getNif()+ ")" , "una modificación de los datos de contacto en su perfil", patient.getUserAccountID().getEmail());
        forward("/administrative/patientedit.jsp");
    }
}
