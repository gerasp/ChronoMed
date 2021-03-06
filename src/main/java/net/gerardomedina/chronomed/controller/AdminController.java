package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/admin")
@Controller
@Scope("session")
public class AdminController extends AbstractController {

    @GetMapping("/patients")
    public ModelAndView patients() {
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action", "patients");
        checkResult(modelAndView);
        return modelAndView;
    }

    @GetMapping("/patient/new")
    public ModelAndView patientRegistration(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("admin", "patient", new Patient());
        modelAndView.addObject("doctors", doctorRepository.list());
        modelAndView.addObject("action", "patient-new");
        return modelAndView;
    }

    @PostMapping("/patient/new")
    public String patientNew(@ModelAttribute("patient") Patient patient,
                              @RequestParam(value = "healthcards") String[] healthcards,
                              @RequestParam(value = "boardNumbers") String[] boardNumbers) {
        patient.setPassword(randomPassword());
        patientRepository.create(patient);

        savedRelations = new ArrayList<>();
        savedDoctors = new ArrayList<>();
        savedHealthcards = new ArrayList<>();

        User user = new User();
        user.setEmail(patient.getEmail());
        user.setPassword(patient.getPassword());
        savedPatient = patientRepository.getPatientByEmail(user);


        if (healthcards != null && healthcards.length>0)editHealthcards(healthcards);
        if (boardNumbers != null && boardNumbers.length>0)editDoctors(boardNumbers);

        result = "infoCreated";
        return "redirect:/admin/patients";
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

        savedDoctors = patientRepository.getDoctors(savedPatient);
        savedRelations = doctorPatientRepository.getDoctorPatients(savedPatient);
        savedHealthcards = patientRepository.getHealthcards(savedPatient);

        modelAndView.addObject("patient", savedPatient);
        modelAndView.addObject("doctors", doctorRepository.list());
        modelAndView.addObject("actualDoctors", savedDoctors);
        modelAndView.addObject("actualHealthcards", savedHealthcards);
        modelAndView.addObject("action", "patient-edit");
        checkResult(modelAndView);
        return modelAndView;
    }

    @PostMapping("/patient/edit")
    public String patientEdit(@ModelAttribute("patient") Patient patient,
                              @RequestParam(value = "healthcards") String[] healthcards,
                              @RequestParam(value = "boardNumbers") String[] boardNumbers) {
        patient.setId(savedPatient.getId());
        patient.setPassword(savedPatient.getPassword());
        patient.setBloodType(savedPatient.getBloodType());
        patient.setFamilyHistory(savedPatient.getFamilyHistory());
        patient.setAllergies(savedPatient.getAllergies());
        patient.setPathologies(savedPatient.getPathologies());
        patient.setSurgeries(savedPatient.getSurgeries());
        patient.setOthers(savedPatient.getOthers());
        patientRepository.update(patient);

        if (healthcards != null && healthcards.length>0)editHealthcards(healthcards);
        if (boardNumbers != null && boardNumbers.length>0)editDoctors(boardNumbers);

        result = "infoUpdated";
        return "redirect:/admin/patients";
    }

    private void editHealthcards(String[] healthcards) {
        List<String> newHealthcards = Arrays.asList(healthcards);
        List<String> oldHealthcards = new ArrayList<>();
        for (Healthcard hc : savedHealthcards) oldHealthcards.add(hc.getNumber());
        for (String newHC : newHealthcards) {
            if (!oldHealthcards.contains(newHC)) {
                Healthcard hc = new Healthcard();
                hc.setNumber(newHC);
                hc.setPatientId(savedPatient.getId());
                healthcardRepository.create(hc);
            }
        }
        for (String oldHC : oldHealthcards) {
            if (!newHealthcards.contains(oldHC)) {
                int idToDelete = 0;
                for (Healthcard hc : savedHealthcards) if (hc.getNumber().equals(oldHC)) idToDelete = hc.getId();
                healthcardRepository.delete(idToDelete);
            }
        }
    }

    private void editDoctors(String[] doctors) {
        List<String> newDoctors = Arrays.asList(doctors);
        List<String> oldDoctors = new ArrayList<>();
        for (Doctor doctor : savedDoctors) oldDoctors.add(doctor.getBoardNumber());
        for (String newDoctor : newDoctors) {
            if (!oldDoctors.contains(newDoctor)) {
                Doctor doctorToAddRelation = doctorRepository.getDoctorByBoardNumber(new Search(newDoctor));
                DoctorPatient doctorPatient = new DoctorPatient();
                doctorPatient.setDoctorId(doctorToAddRelation.getId());
                doctorPatient.setPatientId(savedPatient.getId());
                doctorPatientRepository.create(doctorPatient);
            }
        }
        for (String oldDoctor : oldDoctors) {
            if (!newDoctors.contains(oldDoctor)) {
                int idToDelete = 0;
                Doctor doctorToRemoveRelation = doctorRepository.getDoctorByBoardNumber(new Search(oldDoctor));
                for (DoctorPatient relation : savedRelations)
                    if (relation.getDoctorId() == doctorToRemoveRelation.getId()) idToDelete = relation.getId();
                doctorPatientRepository.delete(idToDelete);
            }
        }
    }

    // =========================================================

    @GetMapping("/doctors")
    public ModelAndView doctors() {
        ModelAndView modelAndView = new ModelAndView("admin", "search", new Search());
        modelAndView.addObject("action", "doctors");
        checkResult(modelAndView);
        return modelAndView;
    }

    @GetMapping("/doctor/new")
    public ModelAndView doctorRegistration() {
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        modelAndView.addObject("action", "doctor-new");
        return modelAndView;
    }

    @PostMapping("/doctor/new")
    public String doctorNew(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setPassword(randomPassword());
        doctorRepository.create(doctor);
        result = "infoCreated";
        return "redirect:/admin/doctors";
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
        checkResult(modelAndView);
        return modelAndView;
    }

    @PostMapping("/doctor/edit")
    public String doctorEdit(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setPassword(savedDoctor.getPassword());
        doctorRepository.update(doctor);
        result = "infoUpdated";
        return "redirect:/admin/doctors";
    }

}