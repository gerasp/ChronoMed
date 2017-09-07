package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.entity.Search;
import net.gerardomedina.chronomed.repository.DoctorRepository;
import net.gerardomedina.chronomed.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Random;

@RequestMapping("/admin")
@Controller
@Scope("session")
public class AdminController {

    // PATIENT MANAGEMENT
    private Patient savedPatient;
    private PatientRepository patientRepository;

    @Autowired
    @Qualifier(value = "patientRepository")
    public void setPatientRepository(PatientRepository ps) {
        this.patientRepository = ps;
    }


    @GetMapping("/patients")
    public ModelAndView patients() {
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action", "patients");
        return modelAndView;
    }

    @GetMapping("/patient/new")
    public ModelAndView patientRegistration(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());
        modelAndView.addObject("action", "patient-new");
        return modelAndView;
    }

    @PostMapping("/patient/new")
    public ModelAndView patientNew(@ModelAttribute("patient") Patient patient) {
        patient.setId(savedPatient.getId());
        patientRepository.create(patient);
        return patients();
    }

    @GetMapping("/patient/edit")
    public ModelAndView patientSearch(@ModelAttribute("search") Search search) {
        savedPatient = patientRepository.getPatientByIdCardOrHealthCard(search);
        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());
        if (savedPatient == null) {
            modelAndView.addObject("action", "patients");
            modelAndView.addObject("result", "patientNotFound");
            return modelAndView;
        }
        modelAndView.addObject("patient", savedPatient);
        modelAndView.addObject("action", "patient-edit");
        return modelAndView;
    }

    @PostMapping("/patient/edit")
    public ModelAndView patientEdit(@ModelAttribute("patient") Patient patient) {
        patient.setId(savedPatient.getId());
        patientRepository.update(patient);
        return patients();
    }


    // DOCTOR MANAGEMENT
    private Doctor savedDoctor;
    private DoctorRepository doctorRepository;

    @Autowired
    @Qualifier(value = "doctorRepository")
    public void setDoctorRepository(DoctorRepository ps) {
        this.doctorRepository = ps;
    }


    @GetMapping("/doctors")
    public ModelAndView doctors() {
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action", "doctors");
        return modelAndView;
    }

    @GetMapping("/doctor/new")
    public ModelAndView doctorRegistration() {
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        modelAndView.addObject("action", "doctor-new");
        return modelAndView;
    }

    @PostMapping("/doctor/new")
    public ModelAndView doctorNew(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setPassword(randomPassword());
        doctorRepository.create(doctor);
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action", "doctors");
        modelAndView.addObject("result", "infoUpdated");
        return modelAndView;
    }

    @GetMapping("/doctor/edit")
    public ModelAndView doctorSearch(@ModelAttribute("search") Search search) {
        savedDoctor = doctorRepository.getDoctorByBoardNumber(search);
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        if (savedDoctor == null) {
            modelAndView.addObject("action", "doctors");
            modelAndView.addObject("result", "doctorNotFound");
            return modelAndView;
        }
        modelAndView.addObject("action", "doctor-edit");
        modelAndView.addObject("doctor", savedDoctor);
        return modelAndView;
    }

    @PostMapping("/doctor/edit")
    public ModelAndView doctorEdit(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setPassword(savedDoctor.getPassword());
        doctorRepository.update(doctor);
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action", "doctors");
        modelAndView.addObject("result", "infoCreated");
        return modelAndView;
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