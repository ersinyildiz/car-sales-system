package com.ersinyildiz.carsalessystem.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class County {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;
    @Column(name = "NAME")
    private String name;
    @ManyToOne
    @JoinColumn(name = "city_id",referencedColumnName = "id")
    private City city;

    public County() {
    }

    public County(String name) {
        this.name = name;
    }

    public County(String name, City city) {
        this.name = name;
        this.city = city;
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

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "County{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
