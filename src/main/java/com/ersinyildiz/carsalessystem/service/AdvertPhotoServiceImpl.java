package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.dao.AdvertPhotoRepository;
import com.ersinyildiz.carsalessystem.model.AdvertPhoto;
import com.ersinyildiz.carsalessystem.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class AdvertPhotoServiceImpl implements AdvertPhotoService{

    @Autowired
    private AdvertPhotoRepository advertPhotoRepository;

    @Override
    public List<AdvertPhoto> findAll() {
        return advertPhotoRepository.findAll();
    }

    @Override
    public AdvertPhoto findById(Long id) {
        return advertPhotoRepository.findById(id).get();
    }

    @Override
    public void save(MultipartFile multipartFile, Car car) throws IOException {
        String fileName = StringUtils.cleanPath(Objects.requireNonNull(multipartFile.getOriginalFilename()));
        AdvertPhoto advertPhoto = new AdvertPhoto(fileName, multipartFile.getContentType(), multipartFile.getBytes());
        advertPhoto.setCar(car);
        advertPhotoRepository.save(advertPhoto);
    }
}
