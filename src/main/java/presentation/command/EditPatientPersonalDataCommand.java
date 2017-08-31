package presentation.command;

import business.utils.Email;
import data.entities.Administrative;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.PatientFacade;
import java.util.Date;

public class EditPatientPersonalDataCommand extends FrontCommand {

    @Override
    public void process() {
        PatientFacade patientFacade = AbstractFacade.getFacade("PatientFacade");
        Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
        patient.setName(request.getParameter("name"));
        patient.setSurname(request.getParameter("surname"));
        patient.setNif(request.getParameter("nif"));
        patient.setBirthDate(getDate());
        patient.setGender(request.getParameter("gender"));
        patient.setNationality(request.getParameter("nationality"));
        
        patientFacade.edit(patient);
        Administrative session = (Administrative) request.getSession().getAttribute("user");
        Email.sendNotification(session.getSurname() +", " + session.getName() + " (" + session.getNif()+ ")" , "una modificación de los datos personales en su perfil", patient.getUserAccountID().getEmail());
        forward("/administrativo/editarpaciente.jsp");
    }

    private Date getDate() throws NumberFormatException {
        String[] birthdate = request.getParameter("birthdate").split("-");
        final Date date = new Date(Integer.parseInt(birthdate[0]) - 1900, Integer.parseInt(birthdate[1]) - 1, Integer.parseInt(birthdate[2]));
        return date;
    }
}
