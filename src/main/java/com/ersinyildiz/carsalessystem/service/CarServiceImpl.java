package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.dao.CarRepository;
import com.ersinyildiz.carsalessystem.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CarServiceImpl implements CarService{

    private CarRepository carRepository;

    @Autowired
    public void setCarRepository(CarRepository carRepository) {
        this.carRepository = carRepository;
    }
    @Override
    public List<Car> findAll() {
        return carRepository.findAll();
    }
    @Override
    public Optional<Car> findById(Long id) {
        return carRepository.findById(id);
    }
    @Override
    public void save(Car car) {
        carRepository.save(car);
    }
    @Override
    public void delete(Long id) {
        carRepository.deleteById(id);
    }
}
