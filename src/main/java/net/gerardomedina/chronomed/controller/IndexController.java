package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Admin;
import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.entity.User;
import net.gerardomedina.chronomed.repository.AdminRepository;
import net.gerardomedina.chronomed.repository.DoctorRepository;
import net.gerardomedina.chronomed.repository.PatientRepository;
import net.gerardomedina.chronomed.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    private UserValidator userValidator = new UserValidator();

    private AdminRepository adminRepository;
    private DoctorRepository doctorRepository;
    private PatientRepository patientRepository;

    @Autowired
    @Qualifier(value="adminRepository")
    public void setAdminRepository(AdminRepository ps){
        this.adminRepository = ps;
    }
    @Autowired
    @Qualifier(value="doctorRepository")
    public void setDoctorRepository(DoctorRepository ps){
        this.doctorRepository = ps;
    }
    @Autowired
    @Qualifier(value="patientRepository")
    public void setPatientRepository(PatientRepository ps){
        this.patientRepository = ps;
    }

    @GetMapping("/")
    public ModelAndView index(HttpSession session) {
        if (session.getAttribute("user")!=null) return login((User)session.getAttribute("user"),session);
        return new ModelAndView("index","user",new User());
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute("user") User user, HttpSession session) {
        //        userValidator.validate(user,result);
        switch (user.getType()) {
            case ADMIN: return loginAdmin(session, user);
            case DOCTOR: return loginDoctor(session, user);
            case PATIENT: return loginPatient(session, user);
        }
        return index(session);
    }

    @GetMapping("/logout")
    public ModelAndView login(HttpSession session) {
        session.invalidate();
        return new ModelAndView("index","user",new User());
    }

    @GetMapping(value = "/changeLanguage/{language}")
    public String login(@PathVariable(value = "language") String language, HttpSession session) {
        session.setAttribute("language",language);
        return "redirect:/";
    }


    private ModelAndView loginAdmin(HttpSession session, User user) {
        Admin admin = adminRepository.getAdminByEmail(user);
        if(admin != null) {
            session.setAttribute("user", user);
            session.setAttribute("admin", admin);
            return new ModelAndView("redirect:/admin/patients");
        } else return new ModelAndView("index","user",user);
    }

    private ModelAndView loginDoctor(HttpSession session, User user) {
        Doctor doctor = doctorRepository.getDoctorByEmail(user);
        if(doctor != null) {
            session.setAttribute("user", user);
            session.setAttribute("doctor",doctor);
            return new ModelAndView("redirect:/doctor/patients");
        } else return new ModelAndView("index","user",user);
    }

    private ModelAndView loginPatient(HttpSession session, User user) {
        Patient patient = patientRepository.getPatientByEmail(user);
        if(patient != null) {
            session.setAttribute("user", user);
            session.setAttribute("patient", patient);
            return new ModelAndView("redirect:/patient/history");
        } else return new ModelAndView("index","user",user);
    }

}