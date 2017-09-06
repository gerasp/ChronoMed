package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Search;
import net.gerardomedina.chronomed.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class DoctorRepositoryImpl extends AbstractRepositoryImpl implements DoctorRepository {


    public DoctorRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }

    @Transactional
    public Doctor getDoctorByEmail(User user) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Doctor where email = :email and password = :password")
                .setParameter("email",user.getEmail())
                .setParameter("password",user.getPassword())
                .list();
        return result.size() > 0 ? (Doctor)result.get(0) : null;
    }

    @Transactional
    public Doctor getDoctorByBoardNumber(Search search) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Doctor where boardNumber = :boardNumber")
                .setParameter("boardNumber",search.getParameter())
                .list();
        return result.size() > 0 ? (Doctor) result.get(0) : null;
    }

    @Transactional
    public List getPatients(Doctor doctor) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Patient p where p.id in " +
                        "(select dp.patientId from DoctorPatient dp where doctorId = :doctorId)")
                .setParameter("doctorId", doctor.getId())
                .list();
        return result.size() > 0 ? result : null;
    }
}