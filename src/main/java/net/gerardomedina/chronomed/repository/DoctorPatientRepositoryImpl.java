package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Patient;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class DoctorPatientRepositoryImpl extends AbstractRepositoryImpl implements DoctorPatientRepository {


    public DoctorPatientRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }

    @Transactional
    public List getDoctorPatients(Patient patient) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from DoctorPatient dp where patientId = :patientId")
                .setParameter("patientId", patient.getId())
                .list();
        return result.size() > 0 ? result : null;

    }
}