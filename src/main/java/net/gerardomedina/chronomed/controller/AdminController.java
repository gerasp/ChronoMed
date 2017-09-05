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
    public ModelAndView doctors() {
        ModelAndView modelAndView = new ModelAndView("admin", "searchByBoardNumber", new Search());
        modelAndView.addObject("action",0);
        return modelAndView;
    }

    @GetMapping("/doctor/registration")
    public ModelAndView doctorRegistration() {
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        modelAndView.addObject("action", 1);
        return modelAndView;
    }

    @GetMapping("/doctor/search")
    public ModelAndView doctorSearch(@ModelAttribute("searchByBoardNumber") Search search) {
        savedDoctor = doctorRepository.getDoctorByBoardNumber(search);
        ModelAndView modelAndView = new ModelAndView("admin", "doctor", new Doctor());
        modelAndView.addObject("doctor", savedDoctor);
        modelAndView.addObject("action", 2);
        return modelAndView;
    }

    @PostMapping("/doctor/new")
    public ModelAndView doctorNew(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setUserAccountId(savedDoctor.getUserAccountId());
        doctorRepository.create(doctor);
        doctorRepository.create(doctor.getUserByUserAccountId());
        return doctors();
    }

    @PostMapping("/doctor/edit")
    public ModelAndView doctorEdit(@ModelAttribute("doctor") Doctor doctor) {
        doctor.setId(savedDoctor.getId());
        doctor.setUserAccountId(savedDoctor.getUserAccountId());
        doctorRepository.update(doctor);
        doctorRepository.update(doctor.getUserByUserAccountId());
        return doctors();
    }


    @GetMapping("/patients")
    public String patients() {

        return "admin-patients-management";
    }


}