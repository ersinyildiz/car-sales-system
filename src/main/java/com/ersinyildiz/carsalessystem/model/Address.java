package com.ersinyildiz.carsalessystem.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity(name = "address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;

    @OneToOne
    private City city;

    @OneToOne
    private County county;


    @OneToMany(mappedBy = "address")
    private Set<Owner> owners = new HashSet<>();

    public Address() {
    }

    public Address(City city, County county) {
        this.city = city;
        this.county = county;
    }

    public Set<Owner> getOwners() {
        return owners;
    }

    public void setOwners(Set<Owner> owners) {
        this.owners = owners;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public County getCounty() {
        return county;
    }

    public void setCounty(County county) {
        this.county = county;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", city=" + city +
                ", county=" + county +
                '}';
    }
}
