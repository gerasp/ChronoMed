package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.repository.DoctorRepository;
import net.gerardomedina.chronomed.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/doctor")
@Controller
@Scope("session")
public class DoctorController {
    private Doctor savedDoctor;
    private DoctorRepository doctorRepository;
    private List<Patient> savedPatients;

    @Autowired
    @Qualifier(value = "doctorRepository")
    public void setDoctorRepository(DoctorRepository ps) {
        this.doctorRepository = ps;
    }

    @GetMapping("/patients")
    public ModelAndView patients(HttpSession session) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        savedPatients = doctorRepository.getPatients(doctor);
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", 0);
        modelAndView.addObject("patients", savedPatients);
        return modelAndView;
    }

    @GetMapping("/data")
    public ModelAndView data(HttpSession session) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", 1);
        return modelAndView;
    }


    private PatientRepository patientRepository;

    @Autowired
    @Qualifier(value = "patientRepository")
    public void setPatientRepository(PatientRepository ps) {
        this.patientRepository = ps;
    }

    @GetMapping(path = "/patient", params = {"idCard"})
    public @ResponseBody ModelAndView patient(HttpSession session, @RequestParam(value = "idCard") String idCard) {
        Patient patient = null;
        for (Patient savedPatient : savedPatients) if (savedPatient.getIdCard().equals(idCard)) patient = savedPatient;
        if (patient == null) return patients(session);
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", 2);
        modelAndView.addObject("patient", patient);
        return modelAndView;
    }

}