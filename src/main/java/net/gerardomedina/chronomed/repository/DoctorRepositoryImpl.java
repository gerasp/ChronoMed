package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Search;
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
    public Doctor getDoctorByBoardNumber(Search search) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Doctor where boardNumber = :boardNumber")
                .setParameter("boardNumber",search.getParameter())
                .list();
        return result.size() > 0 ? (Doctor) result.get(0) : null;
    }
}