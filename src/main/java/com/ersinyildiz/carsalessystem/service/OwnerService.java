package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.Owner;

import java.util.List;
import java.util.Optional;

public interface OwnerService {
    List<Owner> findAll();
    Optional<Owner> findById(Long id);
    List<Owner> findByFirstName(String firstName);
    Optional<Owner> findByLastnameAndFirstname(String lastName,String firstName);
    void save (Owner owner);
    //Owner update(Owner owner);
    void delete(Long id);
}
