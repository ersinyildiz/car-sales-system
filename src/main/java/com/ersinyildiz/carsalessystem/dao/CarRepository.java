package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarRepository extends JpaRepository<Car, Long> {

}
