package com.ersinyildiz.carsalessystem.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity(name = "city")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;
    @Column(name = "NAME")
    private String name;
    @JsonIgnore
    @OneToMany(mappedBy = "city",cascade = CascadeType.ALL)
    private Set<County> counties = new HashSet<>();

    public City() {
    }

    public City(String name) {
        this.name = name;
    }

    public City(String name, Set<County> counties) {
        this.name = name;
        this.counties = counties;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<County> getCounties() {
        return counties;
    }

    public void setCounties(Set<County> counties) {
        this.counties = counties;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
