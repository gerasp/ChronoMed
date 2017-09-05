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
        if (session.getAttribute("user")!=null) return redirect((User)session.getAttribute("user"));
        return new ModelAndView("index","user",new User());
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute("user") User user, HttpSession session) {
        //        userValidator.validate(user,result);
        Patient patient = patientRepository.getPatientByEmail(user);
        if (patient!=null) {
            user.setType(User.Type.PATIENT);
            session.setAttribute("user", user);
            session.setAttribute("patient", patient);
        } else {
            Doctor doctor = doctorRepository.getDoctorByEmail(user);
            if (doctor!=null) {
                user.setType(User.Type.DOCTOR);
                session.setAttribute("user", user);
                session.setAttribute("doctor", doctor);
            } else {
                Admin admin = adminRepository.getAdminByEmail(user);
                if (admin!=null) {
                    user.setType(User.Type.ADMIN);
                    session.setAttribute("user", user);
                    session.setAttribute("admin", admin);
                } else {
                    return index(session);
                }
            }
        }
        return redirect(user);
    }

    private ModelAndView redirect(User user) {
        switch (user.getType()) {
            case ADMIN: return new ModelAndView("redirect:/admin/patients");
            case DOCTOR: return new ModelAndView("redirect:/doctor/patients");
            case PATIENT: return new ModelAndView("redirect:/patient/history");
        }
        return new ModelAndView("redirect:/");
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
}