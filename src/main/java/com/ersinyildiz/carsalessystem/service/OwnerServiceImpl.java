package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.dao.OwnerRepository;
import com.ersinyildiz.carsalessystem.model.Owner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OwnerServiceImpl implements OwnerService{

    private OwnerRepository ownerRepository;
    @Autowired
    public void setOwnerRepository(OwnerRepository ownerRepository) {
        this.ownerRepository = ownerRepository;
    }

    @Override
    public List<Owner> findAll() {
        return ownerRepository.findAll();
    }

    @Override
    public Optional<Owner> findById(Long id) {
        return ownerRepository.findById(id);
    }

    @Override
    public List<Owner> findByFirstName(String firstName) {
        return ownerRepository.findByFirstName(firstName);
    }

    @Override
    public Optional<Owner> findByLastnameAndFirstname(String lastName, String firstName) {
        return ownerRepository.findByLastnameAndFirstname(lastName,firstName);
    }

    @Override
    public void save(Owner owner) {
        ownerRepository.save(owner);
    }

    /*@Override
    public Owner update(Owner owner) {
        return ownerRepository.update(owner);
    }*/

    @Override
    public void delete(Long id) {
        ownerRepository.deleteById(id);
    }


}
