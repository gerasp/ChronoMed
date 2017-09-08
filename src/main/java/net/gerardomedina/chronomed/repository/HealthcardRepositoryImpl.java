package net.gerardomedina.chronomed.repository;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class HealthcardRepositoryImpl extends AbstractRepositoryImpl implements HealthcardRepository {


    public HealthcardRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }
}