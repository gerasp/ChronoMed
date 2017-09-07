package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.repository.AdminRepository;
import net.gerardomedina.chronomed.repository.DoctorRepository;
import net.gerardomedina.chronomed.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;

import java.util.Random;

public abstract class AbstractController {

    AdminRepository adminRepository;
    DoctorRepository doctorRepository;
    PatientRepository patientRepository;
    private String result;


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


    private void checkResult(ModelAndView modelAndView) {
        if (result!= null) {
            modelAndView.addObject("result",result);
            result = null;
        }
    }

    private String randomPassword() {
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