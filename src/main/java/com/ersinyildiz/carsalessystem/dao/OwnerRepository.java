package com.ersinyildiz.carsalessystem.dao;

import com.ersinyildiz.carsalessystem.model.Owner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OwnerRepository extends JpaRepository<Owner, Long> {
    @Query("from owner o where o.firstName = :firstname")
    List<Owner> findByFirstName(@Param("firstname")String firstname);
    @Query("select o from owner o where o.firstName = :firstname and o.lastName = :lastname")
    Optional<Owner> findByLastnameAndFirstname(@Param("lastname") String lastname, @Param("firstname") String firstname);
}
