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

import javax.servlet.http.HttpSession;

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
    public ModelAndView patients(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("patient","patient",(Patient)session.getAttribute("patient"));
        modelAndView.addObject("action",0);
        return modelAndView;
    }

}