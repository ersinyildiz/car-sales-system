package com.ersinyildiz.carsalessystem.configuration;

import com.ersinyildiz.carsalessystem.dao.*;
import com.ersinyildiz.carsalessystem.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class DataLoader implements ApplicationRunner {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private CarRepository carRepository;
    private OwnerRepository ownerRepository;
    private AdvertRepository advertRepository;

    @Autowired
    public DataLoader(UserRepository userRepository, RoleRepository roleRepository,CarRepository carRepository,OwnerRepository ownerRepository,AdvertRepository advertRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.carRepository = carRepository;
        this.ownerRepository = ownerRepository;
        this.advertRepository = advertRepository;
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        /*Role userRole = new Role("ROLE_USER");
        Role adminRole = new Role("ROLE_ADMIN");
        roleRepository.save(userRole);
        roleRepository.save(adminRole);

        Vector<Role> v = new Vector<>();
        v.add(userRole);
        v.add(adminRole);
        Enumeration<Role> e = v.elements();

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String password = "{bcrypt}"+passwordEncoder.encode("pass");
        User admin = new User("admin",password,"admin@gmail.com",true);
        password = "{bcrypt}"+passwordEncoder.encode("pass");
        User user1 = new User("user1",password,"user1@gmail.com",true);
        password = "{bcrypt}"+passwordEncoder.encode("pass");
        User user2 = new User("user2",password,"user2@gmail.com",true);
        password = "{bcrypt}"+passwordEncoder.encode("pass");
        User user3 = new User("user3",password,"user3@gmail.com",true);
        password = "{bcrypt}"+passwordEncoder.encode("pass");
        User user4 = new User("user4",password,"user4@gmail.com",true);
        userRepository.save(admin);
        userRepository.save(user1);
        userRepository.save(user2);
        userRepository.save(user3);
        userRepository.save(user4);

        Set<Role> userRoleSet = new HashSet<>(Collections.singletonList(userRole));
        Set<Role> adminRoleSet = new HashSet<>(Collections.list(e));
        User u = userRepository.findUserByUsername(admin.getUsername());
        u.setRoles(adminRoleSet);
        userRepository.saveAndFlush(u);
        u = userRepository.findUserByUsername(user1.getUsername());
        u.setRoles(userRoleSet);
        userRepository.saveAndFlush(u);
        u = userRepository.findUserByUsername(user2.getUsername());
        u.setRoles(userRoleSet);
        userRepository.saveAndFlush(u);
        u = userRepository.findUserByUsername(user3.getUsername());
        u.setRoles(userRoleSet);
        userRepository.saveAndFlush(u);
        u = userRepository.findUserByUsername(user4.getUsername());
        u.setRoles(userRoleSet);
        userRepository.saveAndFlush(u);*/
        Car car = carRepository.findAll().get(1);
        Owner owner = ownerRepository.findAll().get(1);
        advertRepository.save(new Advert("baslik","aciklama",new Date(),245000L,car));
    }
}
