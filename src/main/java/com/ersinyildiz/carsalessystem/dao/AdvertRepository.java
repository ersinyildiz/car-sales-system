package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.Advert;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertRepository extends JpaRepository<Advert, Long> {
}
