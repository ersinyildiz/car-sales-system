package com.ersinyildiz.carsalessystem.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity(name = "advert")
public class Advert {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;
    @Column(name = "TITLE")
    private String title;
    @Column(name = "DESCRIPTION")
    private String description;
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    @Column(name = "CREATEDAT")
    private Date createdAt;
    @Column(name = "PRICE")
    private Long price;

    @OneToOne
    private Car car;

    public Advert() {
    }

    public Advert(String title, String description, Date createdAt, Long price, Car car) {
        this.title = title;
        this.description = description;
        this.createdAt = createdAt;
        this.price = price;
        this.car = car;
    }

    @Override
    public String toString() {
        return "Advert{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                ", price=" + price +
                ", car=" + car.toString() +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }
}
