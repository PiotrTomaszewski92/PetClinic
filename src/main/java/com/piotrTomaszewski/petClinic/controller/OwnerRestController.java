package com.piotrTomaszewski.petClinic.controller;

import com.piotrTomaszewski.petClinic.dao.OwnerDao;
import com.piotrTomaszewski.petClinic.entity.Owner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/")
public class OwnerRestController {
    private OwnerDao ownerDAO;

    @Autowired
    public OwnerRestController(OwnerDao ownerDAO) {
        this.ownerDAO = ownerDAO;
    }

    @GetMapping("/owners")
    public List<Owner> getAll(){
        return ownerDAO.getOwnersList();
    }
}
