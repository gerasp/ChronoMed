package net.gerardomedina.chronomed.repository;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ConsultationRepositoryImpl extends AbstractRepositoryImpl implements ConsultationRepository {


    public ConsultationRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }
}