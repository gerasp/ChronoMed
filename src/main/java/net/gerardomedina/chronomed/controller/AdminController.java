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
import java.util.Arrays;
import java.util.Locale;

@RequestMapping("/admin")
@Controller
@Scope("session")
public class AdminController {

    // PATIENT MANAGEMENT
    private Patient savedPatient;
    private PatientRepository patientRepository;
    @Autowired
    @Qualifier(value="patientRepository")
    public void setPatientRepository(PatientRepository ps){
        this.patientRepository = ps;
    }


    @GetMapping("/patients")
    public ModelAndView patients() {
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action",0);
        return modelAndView;
    }

    @GetMapping("/patient/registration")
    public ModelAndView patientRegistration(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());
        modelAndView.addObject("action", 1);
        return modelAndView;
    }

    @GetMapping("/patient/search")
    public ModelAndView patientSearch(@ModelAttribute("search") Search search) {
        savedPatient = patientRepository.getPatientByIdCard(search);
        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());

        modelAndView.addObject("countryList",  Arrays.asList(Locale.getISOCountries()));
        modelAndView.addObject("patient", savedPatient);
        modelAndView.addObject("action", 2);
        return modelAndView;
    }

    @PostMapping("/patient/new")
    public ModelAndView patientNew(@ModelAttribute("patient") Patient patient) {
        patient.setId(savedPatient.getId());
        patientRepository.create(patient);
        return patients();
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
    @Qualifier(value="doctorRepository")
    public void setDoctorRepository(DoctorRepository ps){
        this.doctorRepository = ps;
    }


    @GetMapping("/doctors")
    public ModelAndView doctors() {
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action",3);
        return modelAndView;
    }

    @GetMapping("/doctor/registration")
    public ModelAndView doctorRegistration() {
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        modelAndView.addObject("action", 4);
        return modelAndView;
    }

    @GetMapping("/doctor/search")
    public ModelAndView doctorSearch(@ModelAttribute("search") Search search) {
        savedDoctor = doctorRepository.getDoctorByBoardNumber(search);
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        if (savedDoctor == null) {
            modelAndView.addObject("action", 3);
            modelAndView.addObject("result",7);
            return modelAndView;
        }
        modelAndView.addObject("action", 5);
        modelAndView.addObject("doctor", savedDoctor);
        return modelAndView;
    }

    @PostMapping("/doctor/new")
    public ModelAndView doctorNew(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctorRepository.create(doctor);
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action",3);
        modelAndView.addObject("result",0);
        return modelAndView;
    }

    @PostMapping("/doctor/edit")
    public ModelAndView doctorEdit(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setPassword(savedDoctor.getPassword());
        doctorRepository.update(doctor);
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action",3);
        modelAndView.addObject("result",1);
        return modelAndView;
    }





}