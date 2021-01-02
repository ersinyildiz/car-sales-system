package com.ersinyildiz.carsalessystem.controller;

import com.ersinyildiz.carsalessystem.model.City;
import com.ersinyildiz.carsalessystem.model.County;
import com.ersinyildiz.carsalessystem.service.CityService;
import com.ersinyildiz.carsalessystem.service.CountyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CityAndCountyRestController {

    @Autowired
    private CityService cityService;

    @Autowired
    private CountyService countyService;

    @GetMapping("/cities")
    public List<City> getCities(){
        return cityService.findAll();
    }

    @GetMapping("/counties")
    public List<County> getCounties(){
        return countyService.findAll();
    }
}
