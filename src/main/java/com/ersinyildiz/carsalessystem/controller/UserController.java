package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.Car;
import com.ersinyildiz.carsalessystem.model.Owner;
import com.ersinyildiz.carsalessystem.model.User;
import com.ersinyildiz.carsalessystem.service.CarService;
import com.ersinyildiz.carsalessystem.service.OwnerService;
import com.ersinyildiz.carsalessystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "user/users",method = RequestMethod.GET)
    public ModelAndView getUsers(){
        List<User> users = userService.findAll();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/dashboard/user/users");
        mav.addObject("userList",users);
        return mav;
    }

    @RequestMapping(value = "user/search",method = RequestMethod.GET)
    public ModelAndView searchUser(@RequestParam(required = false) String username){
        ModelAndView mav = new ModelAndView();
        if(username == null){
            mav.setViewName("/dashboard/user/search");
            return mav;
        }
        Optional<User> users = userService.findUserByUsername(username);
        if (users.isEmpty()){
            mav.addObject("notFoundUser","Sistemde <b>" + username + "</b> isimli bir kullanıcı bulunamadı! Lütfen tekrar deneyiniz!");
            mav.setViewName("/dashboard/user/search");
            return mav;
        }
        List<User> userList = new ArrayList<>(Collections.singletonList(users.get()));
        mav.addObject("foundedUser","<b>"+username+"</b>"+" adlı kullanıcı bilgileri başarıyla getirildi.");
        mav.addObject("userList",userList);
        mav.setViewName("/dashboard/user/users");
        return mav;
    }

}
