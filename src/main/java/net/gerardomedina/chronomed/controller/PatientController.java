package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/patient")
@Controller
@Scope("session")
public class PatientController {

    private Patient savedPatient;
    private PatientRepository patientRepository;
    @Autowired
    @Qualifier(value="patientRepository")
    public void setPatientRepository(PatientRepository ps){
        this.patientRepository = ps;
    }

    @GetMapping("/history")
    public ModelAndView patients() {
        ModelAndView modelAndView = new ModelAndView("patient","patient",new Patient());
        modelAndView.addObject("action",0);
        return modelAndView;
    }

//    @GetMapping("/patient/registration")
//    public ModelAndView patientRegistration(HttpSession session) {
//        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());
//        modelAndView.addObject("action", 1);
//        return modelAndView;
//    }
//
//    @GetMapping("/patient/search")
//    public ModelAndView patientSearch(@ModelAttribute("search") Search search) {
//        savedPatient = patientRepository.getPatientByIdCard(search);
//        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());
//
//        modelAndView.addObject("countryList",  Arrays.asList(Locale.getISOCountries()));
//        modelAndView.addObject("patient", savedPatient);
//        modelAndView.addObject("action", 2);
//        return modelAndView;
//    }
//
//    @PostMapping("/patient/new")
//    public ModelAndView patientNew(@ModelAttribute("patient") Patient patient) {
//        patient.setId(savedPatient.getId());
//        patient.setUserAccountId(savedPatient.getUserAccountId());
//        patientRepository.create(patient);
//        patientRepository.create(patient.getUserByUserAccountId());
//        return patients();
//    }
//
//    @PostMapping("/patient/edit")
//    public ModelAndView patientEdit(@ModelAttribute("patient") Patient patient) {
//        patient.setId(savedPatient.getId());
//        patient.setUserAccountId(savedPatient.getUserAccountId());
//        patientRepository.update(patient);
//        patientRepository.update(patient.getUserByUserAccountId());
//        return patients();
//    }


}