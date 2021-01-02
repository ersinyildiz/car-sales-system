package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.County;

import java.util.List;
import java.util.Optional;

public interface CountyService {
    List<County> findAll();
    Optional<County> findById(Long id);
}
