package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.User;
import com.ersinyildiz.carsalessystem.service.CarService;
import com.ersinyildiz.carsalessystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    private UserService userService;
    private CarService carService;

    @Autowired
    public void setUserService(UserService userService,CarService carService) {
        this.userService = userService;
        this.carService = carService;
    }

    @RequestMapping(value={"/","/index","/index.html"})
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value = {"/login","login.html"})
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard(){
        ModelAndView mav = new ModelAndView();
        //mav.addObject("totalCars",carService.totalCars());
        mav.addObject("totalUsers",userService.totalUsers());
        mav.setViewName("dashboard/dashboard");
        return mav;
    }
    @RequestMapping("/adverts")
    public ModelAndView adverts(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("carList",carService.findAll());
        mav.setViewName("adverts");
        return mav;
    }


}
