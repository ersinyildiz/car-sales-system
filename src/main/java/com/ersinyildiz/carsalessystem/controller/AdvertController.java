package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.Advert;
import com.ersinyildiz.carsalessystem.model.Car;
import com.ersinyildiz.carsalessystem.model.Owner;
import com.ersinyildiz.carsalessystem.service.AdvertService;
import com.ersinyildiz.carsalessystem.service.CarService;
import com.ersinyildiz.carsalessystem.service.OwnerService;
import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class AdvertController {

    private AdvertService advertService;
    @Autowired
    public void setAdvertService(AdvertService advertService) {
        this.advertService = advertService;
    }
    @RequestMapping(method = RequestMethod.GET, value = "/advert/adverts")
    public ModelAndView getAdverts(){
        ModelAndView mav = new ModelAndView();
        List<Advert> adverts = advertService.findAll();
        mav.addObject("advertList",adverts);
        mav.setViewName("/dashboard/advert/adverts");
        return mav;
    }
    @RequestMapping(method = RequestMethod.GET, value = "/advert/details/{id}")
    public ModelAndView detailsPage(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView();
        Optional<Advert> advert = advertService.findById(id);
        mav.addObject("advert",advert.get());
        mav.setViewName("/dashboard/advert/details");
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/advert/add")
    public ModelAndView addAdvertPage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/dashboard/advert/add");
        return mav;
    }



}
