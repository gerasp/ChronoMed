package presentation.command;

import data.entities.Doctor;
import data.entities.DoctorPatient;
import data.entities.Patient;
import data.facades.AbstractFacade;
import data.facades.DoctorFacade;
import data.facades.DoctorPatientFacade;
import data.facades.PatientFacade;
import java.util.ArrayList;
import java.util.List;

public class AssociateDoctorsCommand extends FrontCommand {

    @Override
    public void process() {
        Patient patient = getPatient();
        List<Doctor> addedDoctors = getDoctors(true);
        List<Doctor> deletedDoctors = getDoctors(false);

        updateAssociations(addedDoctors, patient, true);
        updateAssociations(deletedDoctors, patient, false);

        forward("/administrativo/editarpaciente.jsp");
    }

    private Patient getPatient() {
        Integer patientId = Integer.parseInt(request.getParameter("id"));
        PatientFacade pFacade = AbstractFacade.getFacade("PatientFacade");
        return pFacade.find(patientId);
    }

    private List<Doctor> getDoctors(boolean added) {
        List<Doctor> doctors = new ArrayList<>();
        String[] boardNumbers = request.getParameterValues(added ? "addedBoardNumbers" : "deletedBoardNumbers");
        if (boardNumbers == null) {
            return doctors;
        }
        DoctorFacade dFacade = AbstractFacade.getFacade("DoctorFacade");

        for (String boardNumber : boardNumbers) {
            boardNumber = boardNumber.substring(boardNumber.indexOf("(") + 1, boardNumber.length() - 1);
            doctors.add(dFacade.findByBoardNumber(boardNumber).get(0));
        }

        return doctors;
    }

    private DoctorPatient getDoctorPatient(Patient patient, Doctor doctor, boolean added) {
        if (added) {
            DoctorPatient doctorPatient = new DoctorPatient();
            doctorPatient.setPatientID(patient);
            doctorPatient.setDoctorID(doctor);
            return doctorPatient;
        } else {
            DoctorPatientFacade dpFacade = AbstractFacade.getFacade("DoctorPatientFacade");
            final DoctorPatient doctorPatient = dpFacade.findByPatientAndDoctor(patient, doctor);
            return doctorPatient;
        }
    }

    private void updateAssociations(List<Doctor> doctors, Patient patient, boolean added) {
        for (Doctor doctor : doctors) {
            persistOrDeleteAssociation(added, getDoctorPatient(patient, doctor, added));
        }
    }

    private void persistOrDeleteAssociation(boolean added, DoctorPatient doctorPatient) {
        DoctorPatientFacade dpFacade = AbstractFacade.getFacade("DoctorPatientFacade");
        if (added) {
            dpFacade.create(doctorPatient);
        } else {
            dpFacade.remove(doctorPatient);
        }
    }
}
