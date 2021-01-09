package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.AdvertPhoto;
import com.ersinyildiz.carsalessystem.model.Car;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface AdvertPhotoService {
    List<AdvertPhoto> findAll();
    AdvertPhoto findById(Long id);
    void save(MultipartFile multipartFile, Car car) throws IOException;
}
