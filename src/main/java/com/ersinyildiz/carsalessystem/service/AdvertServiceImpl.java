package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.dao.AdvertRepository;
import com.ersinyildiz.carsalessystem.model.Advert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdvertServiceImpl implements AdvertService{

    @Autowired
    private AdvertRepository advertRepository;

    @Override
    public List<Advert> findAll() {
        return advertRepository.findAll();
    }

    @Override
    public Optional<Advert> findById(Long id) {
        return advertRepository.findById(id);
    }

    @Override
    public void save(Advert advert) {
        advertRepository.save(advert);
    }

    @Override
    public void delete(Long id) {
        advertRepository.deleteById(id);
    }
}
