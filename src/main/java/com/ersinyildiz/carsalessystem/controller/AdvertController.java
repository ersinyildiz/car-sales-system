package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.Advert;
import com.ersinyildiz.carsalessystem.model.AdvertPhoto;
import com.ersinyildiz.carsalessystem.model.Car;
import com.ersinyildiz.carsalessystem.model.Owner;
import com.ersinyildiz.carsalessystem.service.AdvertPhotoService;
import com.ersinyildiz.carsalessystem.service.AdvertService;
import com.ersinyildiz.carsalessystem.service.CarService;
import com.ersinyildiz.carsalessystem.service.OwnerService;
import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class AdvertController {

    private AdvertService advertService;
    private OwnerService ownerService;
    private CarService carService;
    private AdvertPhotoService advertPhotoService;
    @Autowired
    public void setAdvertService(AdvertService advertService, OwnerService ownerService, CarService carService,AdvertPhotoService advertPhotoService) {
        this.advertService = advertService;
        this.ownerService = ownerService;
        this.carService = carService;
        this.advertPhotoService = advertPhotoService;
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
        if (advert.isPresent()){
            Advert a = advert.get();
            mav.addObject("advert",a);
        }
        mav.setViewName("/dashboard/advert/details");
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/advert/add")
    public ModelAndView addAdvertPage(){
        ModelAndView mav = new ModelAndView();
        List<Owner> ownerList = ownerService.findAll();
        mav.setViewName("/dashboard/advert/add");
        mav.addObject("ownerList",ownerList);
        return mav;
    }

    @ModelAttribute(name = "saveAdvert")
    public Advert initModel(){
        return new Advert();
    }

    @RequestMapping(method = RequestMethod.POST, value = "/advert/add")
    public ModelAndView addAdvertPage(@ModelAttribute("saveAdvert") Advert advert, @RequestParam("file") MultipartFile[] files, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView();
        if (bindingResult.hasErrors()){
            mav.setViewName("/dashboard/advert/add");
            return mav;
        }

        advert.setCreatedAt(new Date());
        Car car = advert.getCar();
        Long owner_id = advert.getCar().getOwner().getId();
        Optional<Owner> owner = ownerService.findById(owner_id);
        car.setOwner(owner.get());
        carService.save(car);
        advertService.save(advert);
        try {
            for (MultipartFile multipartFile : files){
                advertPhotoService.save(multipartFile,car);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        mav.addObject("advertList",advertService.findAll());
        mav.setViewName("/dashboard/advert/adverts");
        return mav;
    }


}
