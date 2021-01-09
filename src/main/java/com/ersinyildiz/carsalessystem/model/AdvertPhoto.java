package com.ersinyildiz.carsalessystem.model;


import org.apache.tomcat.util.codec.binary.Base64;

import javax.persistence.*;

@Entity(name = "advert_photo")
public class AdvertPhoto {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;
    @Lob
    private byte[] data;
    @Column(name = "NAME")
    private String name;
    @Column(name = "TYPE")
    private String type;
    @ManyToOne
    @JoinColumn
    private Car car;

    public AdvertPhoto() {
    }

    public AdvertPhoto(String name, String type, byte[] data) {
        this.name = name;
        this.type = type;
        this.data = data;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public String getBase64Data(){
        return Base64.encodeBase64String(data);
    }
}
