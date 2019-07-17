package com.piotrTomaszewski.petClinic.dao;

import com.piotrTomaszewski.petClinic.entity.AnimalType;

import java.util.List;

public interface AnimalTypeDao {
    List<AnimalType> getTypeList();
}
