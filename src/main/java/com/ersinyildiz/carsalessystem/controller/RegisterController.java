package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.User;
import com.ersinyildiz.carsalessystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String registerPage(Model model){
        User user = new User();
        model.addAttribute("createUser",user);
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView createUser(@ModelAttribute("createUser") User user, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView();
        if(bindingResult.hasErrors()){
            mav.setViewName("register");
            return mav;
        }
        List<User> userList = userService.findAll();
        boolean existEmail = false;
        for (User u:userList) {
            if(user.getEmail().equalsIgnoreCase(u.getEmail()))
               existEmail=true;
        }
        if (existEmail){
            mav.addObject("alreadyExistsEmail","Mail adresi başka bir kullanıcıya aittir.");
            mav.setViewName("register");
            return mav;
        }
        if((userService.findUserByUsername(user.getUsername())).isPresent()){
            mav.addObject("alreadyExistsUsername","Kullanıcı adı başka bir kullanıcıya aittir.");
            mav.setViewName("register");
            return mav;
        }


        userService.save(user);
        mav.setViewName("redirect:/index");
        return mav;
    }

}
