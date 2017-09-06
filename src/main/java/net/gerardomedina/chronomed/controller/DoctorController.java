package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RequestMapping("/doctor")
@Controller
@Scope("session")
public class DoctorController {
    private Doctor savedDoctor;
    private DoctorRepository doctorRepository;
    @Autowired
    @Qualifier(value="doctorRepository")
    public void setDoctorRepository(DoctorRepository ps){
        this.doctorRepository = ps;
    }

    @GetMapping("/patients")
    public ModelAndView patients(HttpSession session) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor","doctor", doctor);
        modelAndView.addObject("action",0);
        modelAndView.addObject("patients",doctorRepository.getPatients(doctor));
        return modelAndView;
    }

    @GetMapping("/data")
    public ModelAndView data(HttpSession session) {
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView modelAndView = new ModelAndView("doctor","doctor", doctor);
        modelAndView.addObject("action",1);
        return modelAndView;
    }

}