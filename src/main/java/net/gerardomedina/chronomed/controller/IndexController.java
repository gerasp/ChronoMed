package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Admin;
import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController extends AbstractController{

    @GetMapping("/")
    public ModelAndView index(HttpSession session) {
        if (session.getAttribute("user") != null) return redirect((User) session.getAttribute("user"));
        return new ModelAndView("index", "user", new User());
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute("user") User user, HttpSession session) {
        Patient patient = patientRepository.getPatientByEmail(user);
        if (patient != null) {
            if (!patient.getActive()) return notActive();
            loginPatient(user, session, patient);
            return redirect(user);
        }

        Doctor doctor = doctorRepository.getDoctorByEmail(user);
        if (doctor != null){
            if (!doctor.getActive()) return notActive();
            loginDoctor(user, session, doctor);
            return redirect(user);
        }

        Admin admin = adminRepository.getAdminByEmail(user);
        if (admin != null) {
            if (!admin.getActive()) return notActive();
            loginAdmin(user, session, admin);
            return redirect(user);
        }


        ModelAndView modelAndView = new ModelAndView("index", "user", new User());
        modelAndView.addObject("result", "wrongEmailOrPassword");
        return modelAndView;
    }

    private ModelAndView notActive() {
        ModelAndView modelAndView = new ModelAndView("index", "user", new User());
        modelAndView.addObject("result", "notActive");
        return modelAndView;

    }

    private void loginPatient(@ModelAttribute("user") User user, HttpSession session, Patient patient) {
        user.setType(User.Type.PATIENT);
        session.setAttribute("user", user);
        session.setAttribute("patient", patient);
    }

    private void loginDoctor(@ModelAttribute("user") User user, HttpSession session, Doctor doctor) {
        user.setType(User.Type.DOCTOR);
        session.setAttribute("user", user);
        session.setAttribute("doctor", doctor);
    }

    private void loginAdmin(@ModelAttribute("user") User user, HttpSession session, Admin admin) {
        user.setType(User.Type.ADMIN);
        session.setAttribute("user", user);
        session.setAttribute("admin", admin);
    }

    private ModelAndView redirect(User user) {
        switch (user.getType()) {
            case ADMIN:
                return new ModelAndView("redirect:/admin/patients");
            case DOCTOR:
                return new ModelAndView("redirect:/doctor/patients");
            case PATIENT:
                return new ModelAndView("redirect:/patient/history");
        }
        return new ModelAndView("redirect:/");
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping(value = "/changeLanguage", params = {"language","returnTo"})
    public String changeLanguage(@RequestParam(value = "language") String language, @RequestParam(value = "returnTo") String returnTo, HttpSession session) {
        session.setAttribute("language", language);
        return "redirect:"+returnTo;
    }

    @GetMapping(value = "/tac")
    public String tac() {
        return "tac";
    }
}