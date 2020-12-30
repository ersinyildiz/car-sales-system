package com.ersinyildiz.carsalessystem.service;

import com.ersinyildiz.carsalessystem.model.User;
import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> findAll();
    Optional<User> findById(Long id);
    Optional<User> findUserByUsername(String username);
    void save(User user);
    void delete(User user);
    Long totalUsers();
}
