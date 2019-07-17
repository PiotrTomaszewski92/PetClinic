package com.piotrTomaszewski.petClinic.controller;

import com.piotrTomaszewski.petClinic.dao.AnimalTypeDao;
import com.piotrTomaszewski.petClinic.entity.AnimalType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/")
public class AnimalTypeRestController {

    private AnimalTypeDao animalTypeDao;

    @Autowired
    public AnimalTypeRestController(AnimalTypeDao animalTypeDao) {
        this.animalTypeDao = animalTypeDao;
    }

    @GetMapping("/types")
    public List<AnimalType> getTypeList(){
        return animalTypeDao.getTypeList();
    }
}
