package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.County;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountyRepository extends JpaRepository<County,Long> {
}
