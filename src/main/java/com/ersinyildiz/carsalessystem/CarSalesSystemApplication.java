package com.ersinyildiz.carsalessystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class CarSalesSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(CarSalesSystemApplication.class, args);
    }

}
