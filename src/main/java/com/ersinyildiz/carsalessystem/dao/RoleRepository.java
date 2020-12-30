package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role,Long> {
    Role findRoleByName(String roleName);
}
