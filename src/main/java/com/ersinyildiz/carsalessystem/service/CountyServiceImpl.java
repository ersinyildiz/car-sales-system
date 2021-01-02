package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.dao.CountyRepository;
import com.ersinyildiz.carsalessystem.model.County;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CountyServiceImpl implements CountyService{

    @Autowired
    private CountyRepository countyRepository;

    @Override
    public List<County> findAll() {
        return countyRepository.findAll();
    }

    @Override
    public Optional<County> findById(Long id) {
        return countyRepository.findById(id);
    }
}
