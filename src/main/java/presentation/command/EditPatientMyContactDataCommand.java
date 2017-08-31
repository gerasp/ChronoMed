package presentation.command;

import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.FacadeFactory;
import data.facades.PatientFacade;

public class EditPatientMyContactDataCommand extends FrontCommand {

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
        request.getSession().setAttribute("user", patient);
        
        request.setAttribute("message", "Datos cambiados correctamente.");

        forward("/paciente/datos.jsp");
    }
}
