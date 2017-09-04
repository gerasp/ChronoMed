package net.gerardomedina.chronomed.controller;

import net.gerardomedina.chronomed.entity.User;
import net.gerardomedina.chronomed.repository.UserRepository;
import net.gerardomedina.chronomed.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    private UserValidator userValidator = new UserValidator();

    private UserRepository userRepository;
    @Autowired
    @Qualifier(value="userRepository")
    public void setUserRepository(UserRepository ps){
        this.userRepository = ps;
    }

    @GetMapping("/")
    public ModelAndView index(HttpSession session) {
        if (session.getAttribute("user")!=null) return userRedirect(session);
        return new ModelAndView("index","user",new User());
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user,result);
        User checkedUser = userRepository.getUserByEmail(user);
        if(checkedUser != null && !result.hasErrors()) {
            session.setAttribute("user", checkedUser);
            return userRedirect(session);
        }
        else return index(session);
    }

    private ModelAndView userRedirect(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getType().equals("ADMIN")) return new ModelAndView("redirect:/admin/doctors");
        else if (user.getType().equals("DOCTOR")) return new ModelAndView("redirect:/doctor/");
        else if (user.getType().equals("PATIENT")) return new ModelAndView("redirect:/patient/");
        else return index(session);
    }

    @GetMapping("/logout")
    public ModelAndView login(HttpSession session) {
        session.invalidate();
        return new ModelAndView("index","user",new User());
    }

    @GetMapping(value = "/changeLanguage/{language}")
    public String login(@PathVariable(value = "language") String language,
                 HttpSession session) {
        session.setAttribute("language",language);
        return "redirect:/";
    }


//    @ModelAttribute("countryList")
//    public Map<String,String> listadoPaises() {
//        Map<String,String> countries = new LinkedHashMap<>();
//        return countries;
//    }
//

//    @GetMapping("/hola")
//    public String hola(Model m) {
//        m.addAttribute("someAttribute", "hola");
//        return "index";
//    }
//    @RequestMapping("/home/home")
//    public @ResponseBody ModelAndView holaadios(@RequestParam(value = "id") String id) {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("index");
//        modelAndView.addObject("someAttribute",id);
//        return modelAndView;
//    }
}