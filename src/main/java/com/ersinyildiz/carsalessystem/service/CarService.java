package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.Car;

import java.util.List;
import java.util.Optional;

public interface CarService {
    List<Car> findAll();
    Optional<Car> findById(Long id);
    void save(Car car);
    void delete(Long id);
}
