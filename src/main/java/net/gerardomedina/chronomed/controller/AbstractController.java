package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.DoctorPatient;
import net.gerardomedina.chronomed.entity.Healthcard;
import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Random;

public abstract class AbstractController {

    AdminRepository adminRepository;
    DoctorRepository doctorRepository;
    PatientRepository patientRepository;
    ConsultationRepository consultationRepository;
    HealthcardRepository healthcardRepository;
    DoctorPatientRepository doctorPatientRepository;

    Doctor savedDoctor;
    Patient savedPatient;

    List<Doctor> savedDoctors;
    List<Healthcard> savedHealthcards;
    List<DoctorPatient> savedRelations;
    List<Patient> savedPatients;


    String result;


    @Autowired
    @Qualifier(value = "adminRepository")
    public void setAdminRepository(AdminRepository ps) {
        this.adminRepository = ps;
    }

    @Autowired
    @Qualifier(value = "doctorRepository")
    public void setDoctorRepository(DoctorRepository ps) {
        this.doctorRepository = ps;
    }

    @Autowired
    @Qualifier(value = "patientRepository")
    public void setPatientRepository(PatientRepository ps) {
        this.patientRepository = ps;
    }

    @Autowired
    @Qualifier(value = "consultationRepository")
    public void setConsultationRepository(ConsultationRepository ps) {
        this.consultationRepository = ps;
    }

    @Autowired
    @Qualifier(value = "healthcardRepository")
    public void setHealthcardRepository(HealthcardRepository ps) {
        this.healthcardRepository = ps;
    }

    @Autowired
    @Qualifier(value = "doctorPatientRepository")
    public void setDoctorPatientRepository(DoctorPatientRepository ps) {
        this.doctorPatientRepository = ps;
    }


    void checkResult(ModelAndView modelAndView) {
        if (result != null) {
            modelAndView.addObject("result", result);
            result = null;
        }
    }

    String randomPassword() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        return salt.toString();
    }
}