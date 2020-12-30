package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.Advert;
import com.ersinyildiz.carsalessystem.model.Car;

import java.util.List;
import java.util.Optional;

public interface AdvertService {
    List<Advert> findAll();
    Optional<Advert> findById(Long id);
    void save(Advert advert);
    void delete(Long id);
}
