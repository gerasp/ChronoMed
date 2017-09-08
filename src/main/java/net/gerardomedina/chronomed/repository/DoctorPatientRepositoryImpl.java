package net.gerardomedina.chronomed.repository;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DoctorPatientRepositoryImpl extends AbstractRepositoryImpl implements DoctorPatientRepository {


    public DoctorPatientRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }
}