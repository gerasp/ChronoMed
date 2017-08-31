package presentation.command;

import data.entities.Healthcard;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.HealthcardFacade;
import data.facades.PatientFacade;
import java.util.ArrayList;
import java.util.List;

public class AssociateHealthcardsCommand extends FrontCommand {

    @Override
    public void process() {
        Patient patient = getPatient();
        List<Healthcard> addedHealthcards = getHealthcards(patient, true);
        List<Healthcard> deletedHealthcards = getHealthcards(patient, false);

        updateAssociations(addedHealthcards, true);
        updateAssociations(deletedHealthcards, false);

        forward("/administrativo/editarpaciente.jsp");
    }

    private Patient getPatient() throws NumberFormatException {
        Integer patientId = Integer.parseInt(request.getParameter("id"));
        PatientFacade pFacade = AbstractFacade.getFacade("PatientFacade");
        return pFacade.find(patientId);
    }

    private List<Healthcard> getHealthcards(Patient patient, boolean added) {
        List<Healthcard> healthcards = new ArrayList<>();
        String[] healthcardNumbers = request.getParameterValues(added ? "addedHealthCards" : "deletedHealthCards");
        if (healthcardNumbers == null) return healthcards;
        for (String healthcardNumber : healthcardNumbers) {
            healthcards.add(getHealthcard(patient, healthcardNumber, added));
        }

        return healthcards;
    }

    private Healthcard getHealthcard(Patient patient, String healthcardNumber, boolean added) {
        if(added){Healthcard healthcard = new Healthcard();
        healthcard.setPatientID(patient);
        healthcard.setNumber(healthcardNumber);
        return healthcard;
        }else{
            HealthcardFacade hcFacade = AbstractFacade.getFacade("HealthcardFacade");
            return hcFacade.findByPatientAndNumber(patient, healthcardNumber);
        }
    }

    private void updateAssociations(List<Healthcard> healthcards, boolean added) {
        for (Healthcard healthcard : healthcards) {
            persistOrDeleteAssociation(added, healthcard);
        }
    }

    private void persistOrDeleteAssociation(boolean added, Healthcard healthcard) {
        HealthcardFacade hcFacade = AbstractFacade.getFacade("HealthcardFacade");
        if (added) {
            hcFacade.create(healthcard);
        } else {
            hcFacade.remove(healthcard);
        }
    }
}
