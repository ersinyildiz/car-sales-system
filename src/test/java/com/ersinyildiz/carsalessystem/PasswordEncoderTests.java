package com.ersinyildiz.carsalessystem;

import com.ersinyildiz.carsalessystem.dao.CarRepository;
import com.ersinyildiz.carsalessystem.model.Car;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Optional;

public class PasswordEncoderTests {

    @Test
    public void generateEncodedPasswords(){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    }

}
