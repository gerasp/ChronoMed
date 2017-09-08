package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Patient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/doctor")
@Controller
@Scope("session")
public class DoctorController extends AbstractController {
    private List<Patient> savedPatients;

    @GetMapping("/patients")
    public ModelAndView patients(HttpSession session) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        savedPatients = doctorRepository.getPatients(doctor);
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", "patients");
        modelAndView.addObject("patients", savedPatients);
        return modelAndView;
    }

    @GetMapping(path = "/patient", params = {"idCard"})
    public @ResponseBody ModelAndView patient(HttpSession session, @RequestParam(value = "idCard") String idCard) {
        savedPatient = null;
        for (Patient savedPatient : savedPatients) if (savedPatient.getIdCard().equals(idCard)) this.savedPatient = savedPatient;
        if (savedPatient == null) return patients(session);
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", "patient");
        modelAndView.addObject("patient", savedPatient);
        checkResult(modelAndView);
        return modelAndView;
    }

    @PostMapping(path = "/patient/edit")
    public @ResponseBody ModelAndView patientEdit(HttpSession session, @ModelAttribute("patient") Patient patient) {
        savedPatient.setBloodType(patient.getBloodType());
        savedPatient.setFamilyHistory(patient.getFamilyHistory());
        savedPatient.setAllergies(patient.getAllergies());
        savedPatient.setPathologies(patient.getPathologies());
        savedPatient.setSurgeries(patient.getSurgeries());
        savedPatient.setOthers(patient.getOthers());
        patientRepository.update(savedPatient);

        result="infoUpdated";
        return patient(session,savedPatient.getIdCard());
    }

    @GetMapping("/data")
    public ModelAndView data(HttpSession session) {
        savedDoctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", savedDoctor);
        modelAndView.addObject("action", "data");
        checkResult(modelAndView);
        return modelAndView;
    }

    @PostMapping("/data")
    public String doctorEdit(@ModelAttribute("doctor") Doctor doctor,
                             @RequestParam(value = "oldPassword") String oldPassword,
                             @RequestParam(value = "newPassword") String newPassword) {
        if (oldPassword.equals(savedDoctor.getPassword())) {
            doctor.setId(savedDoctor.getId());
            if (!newPassword.equals("")) doctor.setPassword(newPassword);
            else doctor.setPassword(savedDoctor.getPassword());
            doctorRepository.update(doctor);
            result = "infoUpdated";
        } else result = "wrongPassword";
        return "redirect:/admin/data";
    }

}