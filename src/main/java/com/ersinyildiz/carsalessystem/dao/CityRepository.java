package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends JpaRepository<City,Long> {
}
