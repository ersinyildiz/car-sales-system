package com.ersinyildiz.carsalessystem.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.tomcat.util.codec.binary.Base64;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity(name = "car")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;
    @Column(name = "Brand")
    private String brand;
    @Column(name = "Model")
    private String model;
    @Column(name = "Year")
    private int year;
    @Column(name = "KM")
    private int km;
    @Column(name = "Color")
    private String color;

    @JoinColumn
    @ManyToOne
    private Owner owner;

    @OneToOne(mappedBy = "car",cascade = CascadeType.ALL)
    @JoinColumn
    private Advert advert;

    @JsonIgnore
    @OneToMany(mappedBy = "car",cascade = CascadeType.ALL)
    private Set<AdvertPhoto> photoSet = new HashSet<>();



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getKm() {
        return km;
    }

    public void setKm(int km) {
        this.km = km;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }

    public Advert getAdvert() {
        return advert;
    }

    public void setAdvert(Advert advert) {
        this.advert = advert;
    }

    public Set<AdvertPhoto> getPhotoSet() {
        return photoSet;
    }

    public void setPhotoSet(Set<AdvertPhoto> photoSet) {
        this.photoSet = photoSet;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", year=" + year +
                ", km=" + km +
                ", color='" + color + '\'' +
                ", owner=" + owner.getFirstName() +
                '}';
    }


}
