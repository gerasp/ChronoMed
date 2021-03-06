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
    public Patient getPatientByIdCardOrHealthCard(Search search) {
        List result = null;
        switch (search.getType()) {
            case "idCard":
                result = this.sessionFactory.getCurrentSession()
                        .createQuery("from Patient where idCard = :idCard")
                        .setParameter("idCard",search.getParameter())
                        .list();
                break;
            case "healthcard":
                result = this.sessionFactory.getCurrentSession()
                        .createQuery("from Patient p where p.id in " +
                                "(select hc.patientId from Healthcard hc where hc.number = :healthcard)")
                        .setParameter("healthcard", search.getParameter())
                        .list();

        }


        return result.size() > 0 ? (Patient) result.get(0) : null;
    }

    @Transactional
    public List getConsultations(Patient patient) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Consultation where patientId = :patientId")
                .setParameter("patientId", patient.getId())
                .list();
        return result.size() > 0 ? result : null;

    }

    @Transactional
    public List getDoctors(Patient patient) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Doctor d where d.id in " +
                        "(select dp.doctorId from DoctorPatient dp where patientId = :patientId)")
                .setParameter("patientId", patient.getId())
                .list();
        return result.size() > 0 ? result : null;

    }

    @Transactional
    public List getHealthcards(Patient patient) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Healthcard h where h.patientId = :patientId")
                .setParameter("patientId", patient.getId())
                .list();
        return result.size() > 0 ? result : null;
    }
}