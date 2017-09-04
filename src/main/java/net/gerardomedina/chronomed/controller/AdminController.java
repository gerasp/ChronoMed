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

    @PostMapping("/doctor/edit")
    public ModelAndView doctorEdit(@ModelAttribute("searchByBoardNumber") Search search) {
        if (search==null) return new ModelAndView("redirect:/admin/doctors");

        Doctor doctor = doctorRepository.getDoctorByBoardNumber(search);
        ModelAndView modelAndView = new ModelAndView("admin-doctors-management", "doctor", new Doctor());
        modelAndView.addObject("doctor", doctor);
        return modelAndView;
    }


    @GetMapping("/doctor/new")
    public String doctorRegistration() {

        return "admin-doctors-registration";
    }



    @GetMapping("/patients")
    public String patientsManagement() {

        return "admin-patients-management";
    }


}