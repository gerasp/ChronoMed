package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Consultation;
import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Patient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/doctor")
@Controller
@Scope("session")
public class DoctorController extends AbstractController {
    private List<Patient> savedPatients;

    @GetMapping(path = "/patients")
    public ModelAndView patients(HttpSession session) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        savedPatients = doctorRepository.getPatients(doctor);
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", "patients");
        modelAndView.addObject("patients", savedPatients);
        return modelAndView;
    }

    @GetMapping(path = "/patients/search", params = {"idCard"})
    public ModelAndView patientsSearch(HttpSession session,  @RequestParam(value = "idCard") String idCard) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor", "doctor", doctor);
        modelAndView.addObject("action", "patients");
        modelAndView.addObject("patients", filterPatients(idCard));
        return modelAndView;
    }

    private List<Patient> filterPatients(String idCard) {
        List<Patient> filteredPatients = new ArrayList<>();
        if (idCard.equals("")) filteredPatients = savedPatients;
        else for (Patient p : savedPatients) if (p.getIdCard().contains(idCard)) filteredPatients.add(p);
        return filteredPatients;
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
        modelAndView.addObject("consultation", new Consultation());
        modelAndView.addObject("consultations", patientRepository.getConsultations(savedPatient));
        checkResult(modelAndView);
        return modelAndView;
    }

    @PostMapping(path = "/patient/history/edit")
    public @ResponseBody ModelAndView patientHistoryEdit(HttpSession session, @ModelAttribute("patient") Patient patient) {
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

    @PostMapping(path = "/patient/consultation/new")
    public @ResponseBody ModelAndView patientConsultationNew(HttpSession session,
                                                  @ModelAttribute("consultation") Consultation consultation,
                                                  @ModelAttribute("patient") Patient patient) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        consultation.setDate(new Date(12,12,12));
        consultation.setDoctorId(doctor.getId());
        consultation.setPatientId(patient.getId());
        consultationRepository.create(consultation);
        result="infoCreated";
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
    public String data(@ModelAttribute("doctor") Doctor doctor,
                             @RequestParam(value = "oldPassword") String oldPassword,
                             @RequestParam(value = "newPassword") String newPassword) {
        if (oldPassword.equals(savedDoctor.getPassword())) {
            savedDoctor.setPhoneNumber(doctor.getPhoneNumber());
            savedDoctor.setAlternativePhoneNumber(doctor.getAlternativePhoneNumber());
            savedDoctor.setEmail(doctor.getEmail());
            if (!newPassword.equals("")) savedDoctor.setPassword(newPassword);
            doctorRepository.update(savedDoctor);
            result = "infoUpdated";
        } else result = "wrongPassword";
        return "redirect:/doctor/data";
    }

}