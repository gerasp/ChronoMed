package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Search;
import net.gerardomedina.chronomed.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/admin")
@Controller
@Scope("session")
public class AdminController {

    private Doctor savedDoctor;
    private DoctorRepository doctorRepository;
    @Autowired
    @Qualifier(value="doctorRepository")
    public void setDoctorRepository(DoctorRepository ps){
        this.doctorRepository = ps;
    }


    @GetMapping("/doctors")
    public ModelAndView doctorManagement() {
        return new ModelAndView("admin-doctors-management","searchByBoardNumber",new Search());
    }

    @PostMapping("/doctor/search")
    public ModelAndView doctorFind(@ModelAttribute("searchByBoardNumber") Search search) {
        savedDoctor = doctorRepository.getDoctorByBoardNumber(search);
        ModelAndView modelAndView = new ModelAndView("admin-doctors-management", "doctor", new Doctor());
        modelAndView.addObject("doctor", savedDoctor);
        return modelAndView;
    }

    @PostMapping("/doctor/edit")
    public ModelAndView doctorEdit(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setUserAccountId(savedDoctor.getUserAccountId());
        doctorRepository.update(doctor);
        doctorRepository.update(doctor.getUserByUserAccountId());
        return doctorManagement();
    }

    @GetMapping("/doctor/registration")
    public ModelAndView doctorRegistration() {
        return new ModelAndView("admin-doctors-registration","doctor",new Doctor());
    }



    @GetMapping("/patients")
    public String patientsManagement() {

        return "admin-patients-management";
    }


}