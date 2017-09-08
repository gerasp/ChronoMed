package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Patient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RequestMapping("/patient")
@Controller
@Scope("session")
public class PatientController extends AbstractController {

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
        savedPatient = (Patient) session.getAttribute("patient");
        ModelAndView modelAndView = new ModelAndView("patient","patient", savedPatient);
        modelAndView.addObject("action","data");
        modelAndView.addObject("actualHealthcards",patientRepository.getHealthcards(savedPatient));
        checkResult(modelAndView);
        return modelAndView;
    }

    @PostMapping("/data")
    public String data(@ModelAttribute("patient") Patient patient,
                             @RequestParam(value = "oldPassword") String oldPassword,
                             @RequestParam(value = "newPassword") String newPassword) {
        if (oldPassword.equals(savedPatient.getPassword())) {
            savedPatient.setAddress(patient.getAddress());
            savedPatient.setLocality(patient.getLocality());
            savedPatient.setZipCode(patient.getZipCode());
            savedPatient.setProvince(patient.getProvince());
            savedPatient.setCountry(patient.getCountry());
            savedPatient.setPhoneNumber(patient.getPhoneNumber());
            savedPatient.setAlternativePhoneNumber(patient.getAlternativePhoneNumber());
            savedPatient.setEmail(patient.getEmail());
            if (!newPassword.equals("")) savedPatient.setPassword(newPassword);
            patientRepository.update(savedPatient);
            result = "infoUpdated";
        } else result = "wrongPassword";
        return "redirect:/patient/data";
    }

}