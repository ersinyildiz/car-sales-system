package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.AdvertPhoto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertPhotoRepository extends JpaRepository<AdvertPhoto,Long> {
}
