package presentation.command;

import business.utils.Email;
import business.utils.Security;
import data.entities.Healthcard;
import data.entities.Medicalhistory;
import data.entities.Patient;
import data.entities.Useraccount;
import data.facades.*;

import java.util.Date;

public class RegisterPatientCommand extends FrontCommand {

    @Override
    public void process() {
        UseraccountFacade uaFacade = FacadeFactory.getFacade("UseraccountFacade");
        if (uaFacade != null) {
            Useraccount userAccount = getUserAccount();
            uaFacade.create(userAccount);
            PatientFacade pFacade = FacadeFactory.getFacade("PatientFacade");
            if (pFacade != null) {
                Patient patient = getPatient(userAccount);
                pFacade.create(patient);

                addHealthCards(patient);
                createMedicalHistory(patient);

                Email.sendUserAccount(userAccount.getEmail(), userAccount.getPassword(), patient.getName(), patient.getSurname());
                request.setAttribute("result", 1);
                forward("/manager/patient/management.jsp");
                return;
            }
        }
        request.setAttribute("result", 4);
        forward("/manager/patient/management.jsp");
    }

    private Patient getPatient(Useraccount useraccount) throws NumberFormatException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String dni = request.getParameter("nif");
        Date birthDate = getDate();
        String gender = request.getParameter("gender");
        String nacionality = request.getParameter("nationality");
        String address = request.getParameter("address");
        String locality = request.getParameter("locality");
        String zipCode = request.getParameter("zipCode");
        String country = request.getParameter("country");
        String province = request.getParameter("province");
        String phoneNumber = request.getParameter("phoneNumber");
        String alternativePhoneNumber = request.getParameter("alternativePhoneNumber");
        Patient patient = new Patient();
        patient.setName(name);
        patient.setSurname(surname);
        patient.setNif(dni);
        patient.setBirthDate(birthDate);
        patient.setGender(gender);
        patient.setNationality(nacionality);
        patient.setAddress(address);
        patient.setLocality(locality);
        patient.setZipCode(zipCode);
        patient.setCountry(country);
        patient.setProvince(province);
        patient.setPhoneNumber(phoneNumber);
        patient.setAlternativePhoneNumber(alternativePhoneNumber);
        patient.setUserAccountID(useraccount);
        return patient;
    }

    private Date getDate() throws NumberFormatException {
        String[] birthdate = request.getParameter("birthdate").split("-");
        final Date date = new Date(Integer.parseInt(birthdate[0]) - 1900, Integer.parseInt(birthdate[1]) - 1, Integer.parseInt(birthdate[2]));
        return date;
    }

    private Useraccount getUserAccount() {
        String email = request.getParameter("email");
        Useraccount useraccount = new Useraccount();
        useraccount.setEmail(email);
        useraccount.setPassword(Security.generateRandomPassword());
        useraccount.setActive(true);
        return useraccount;
    }

    private void addHealthCards(Patient patient) {
        HealthcardFacade healthcardFacade = FacadeFactory.getFacade("HealthcardFacade");
        final String[] parameterValues = request.getParameterValues("healthCardsList");
        if (parameterValues == null) return;
        for (String healthCard : parameterValues) {
            healthcardFacade.create(getHealthCard(patient, healthCard));
        }
    }

    private Healthcard getHealthCard(Patient patient, String healthCard) throws NumberFormatException {
        Healthcard healthcard = new Healthcard();
        healthcard.setPatientID(patient);
        healthcard.setNumber(healthCard);
        return healthcard;
    }

    private void createMedicalHistory(Patient patient) {
        MedicalhistoryFacade medicalhistoryFacade = FacadeFactory.getFacade("MedicalhistoryFacade");
        Medicalhistory medicalhistory = new Medicalhistory();
        medicalhistory.setBloodType("-");
        medicalhistory.setFamilyHistory("-");
        medicalhistory.setAllergies("-");
        medicalhistory.setPathologies("-");
        medicalhistory.setSurgeries("-");
        medicalhistory.setOthers("-");
        medicalhistory.setPatientID(patient);
        medicalhistoryFacade.create(medicalhistory);
    }

}
