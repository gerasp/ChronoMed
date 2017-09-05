package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.entity.Search;
import net.gerardomedina.chronomed.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class PatientRepositoryImpl extends AbstractRepositoryImpl implements PatientRepository {


    public PatientRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }

    @Transactional
    public Patient getPatientByEmail(User user) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Patient where email = :email and password = :password")
                .setParameter("email",user.getEmail())
                .setParameter("password",user.getPassword())
                .list();
        return result.size() > 0 ? (Patient)result.get(0) : null;
    }

    @Transactional
    public Patient getPatientByIdCard(Search search) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Patient where idCard = :idCard")
                .setParameter("idCard",search.getParameter())
                .list();
        return result.size() > 0 ? (Patient) result.get(0) : null;
    }

    //TODO QUE BUSQUE BIEN
    @Transactional
    public Patient getPatientByHealthCard(Search search) {
        return getPatientByIdCard(search);
    }

    @Transactional
    public List getConsultations(Patient patient) {
        return this.sessionFactory.getCurrentSession()
                .createQuery("from Consultation where patientId = :patientId")
                .setParameter("patientId",patient.getId())
                .list();
    }
}