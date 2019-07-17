package com.piotrTomaszewski.petClinic.dao;

import com.piotrTomaszewski.petClinic.entity.Owner;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class OwnerDaoHibernateImpl implements OwnerDao {

    private EntityManager entityManager;

    @Autowired
    public OwnerDaoHibernateImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public List<Owner> getOwnersList() {
        Session currentSession = entityManager.unwrap(Session.class);
        List<Owner> owners = currentSession.createQuery("from Owner", Owner.class).getResultList();
        return owners;
    }
}
