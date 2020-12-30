package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.Advert;
import com.ersinyildiz.carsalessystem.model.Owner;
import com.ersinyildiz.carsalessystem.model.User;
import com.ersinyildiz.carsalessystem.service.CarService;
import com.ersinyildiz.carsalessystem.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class OwnerController {

    @Autowired
    private OwnerService ownerService;

    @RequestMapping(value = "owner/owners",method = RequestMethod.GET)
    public ModelAndView getOwners(){
        List<Owner> ownerList = ownerService.findAll();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/dashboard/owner/owners");
        mav.addObject("ownerList",ownerList);
        return mav;
    }

    @RequestMapping(value = "owner/search",method = RequestMethod.GET)
    public ModelAndView searchOwner(@RequestParam(value = "firstName",required = false) String firstName ){
        ModelAndView mav = new ModelAndView();
        if(firstName == null){
            mav.setViewName("/dashboard/owner/search");
            return mav;
        }
        List<Owner> ownerList = ownerService.findByFirstName(firstName);

        if (ownerList.isEmpty()){
            mav.addObject("notFoundOwner","Sistemde <b>" + firstName + "</b> isimli bir ilan sahibi bulunamadı! Lütfen tekrar deneyiniz!");
            mav.setViewName("/dashboard/owner/search");
            return mav;
        }
        mav.addObject("foundedOwner","<b>"+firstName+"</b> adlı ilan sahibi bilgileri başarıyla getirildi.");
        mav.addObject("ownerList",ownerList);
        mav.setViewName("/dashboard/owner/owners");
        return mav;
    }

    @RequestMapping(value = "owner/add",method = RequestMethod.GET)
    public String addOwnerPage(){
        return "/dashboard/owner/add";
    }
    @ModelAttribute("createOwner")
    public Owner initModel(){
        return new Owner();
    }

    @RequestMapping(value = "owner/add",method = RequestMethod.POST)
    public ModelAndView addOwner(@ModelAttribute("createOwner") Owner owner, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView();
        if(bindingResult.hasErrors()){
            mav.setViewName("/dashboard/owner/add");
            return mav;
        }
        ownerService.save(owner);
        List<Owner> ownerList = ownerService.findAll();
        mav.addObject("successfullyAddedOwner","<b>"+owner.getFirstName()+" "+owner.getLastName()+
                "</b> isimli ilan sahibi başarıyla kaydedildi.");
        mav.addObject("ownerList",ownerList);
        mav.setViewName("/dashboard/owner/owners");
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/owner/details/{id}")
    public ModelAndView detailsPage(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView();
        Optional<Owner> owner = ownerService.findById(id);
        mav.addObject("owner",owner.get());
        mav.setViewName("/dashboard/owner/details");
        return mav;
    }

}
