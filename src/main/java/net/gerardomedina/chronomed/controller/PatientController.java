package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Patient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RequestMapping("/patient")
@Controller
@Scope("session")
public class PatientController extends AbstractController {

    private Patient savedPatient;

    @GetMapping("/history")
    public ModelAndView history(HttpSession session) {
        Patient patient = (Patient) session.getAttribute("patient");
        ModelAndView modelAndView = new ModelAndView("patient","patient", patient);
        modelAndView.addObject("action","history");
        return modelAndView;
    }

    @GetMapping("/consultations")
    public ModelAndView consultations(HttpSession session) {
        Patient patient = (Patient) session.getAttribute("patient");
        ModelAndView modelAndView = new ModelAndView("patient","patient", patient);
        modelAndView.addObject("action","consultations");
        modelAndView.addObject("consultations",patientRepository.getConsultations(patient));
        return modelAndView;
    }

    @GetMapping("/doctors")
    public ModelAndView doctors(HttpSession session) {
        Patient patient = (Patient) session.getAttribute("patient");
        ModelAndView modelAndView = new ModelAndView("patient","patient", patient);
        modelAndView.addObject("action","doctors");
        modelAndView.addObject("doctors",patientRepository.getDoctors(patient));
        return modelAndView;
    }

    @GetMapping("/data")
    public ModelAndView data(HttpSession session) {
        Patient patient = (Patient) session.getAttribute("patient");
        ModelAndView modelAndView = new ModelAndView("patient","patient", patient);
        modelAndView.addObject("action","data");
        return modelAndView;
    }

}