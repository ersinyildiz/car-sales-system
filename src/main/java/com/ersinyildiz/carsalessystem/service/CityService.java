package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.Car;
import com.ersinyildiz.carsalessystem.model.City;

import java.util.List;
import java.util.Optional;

public interface CityService {
    List<City> findAll();
    Optional<City> findById(Long id);
}
