package com.piotrTomaszewski.petClinic.dao;

import com.piotrTomaszewski.petClinic.entity.AnimalType;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class AnimalTypeDaoHibernateImpl implements AnimalTypeDao {

    private EntityManager entityManager;

    @Autowired
    public AnimalTypeDaoHibernateImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public List<AnimalType> getTypeList() {
        Session currentSession = entityManager.unwrap(Session.class);
        List<AnimalType> animalTypes = currentSession.createQuery("from AnimalType",AnimalType.class).getResultList();
        return animalTypes;
    }
}
