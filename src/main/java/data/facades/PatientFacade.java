/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Doctor;
import data.entities.Patient;
import data.entities.Useraccount;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

/**
 *
 * @author alour
 */
@Stateless
public class PatientFacade extends AbstractFacade<Patient> {

    @PersistenceContext(unitName = "ChronoMedPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PatientFacade() {
        super(Patient.class);
    }

    public Patient findByAccount(Useraccount user) {
        try {
            return (Patient) em.createQuery("SELECT x FROM Patient x WHERE x.userAccountID = :userID", Patient.class)
                    .setParameter("userID", user)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Patient> findByNif(String nif) {
        try {
            return em.createQuery("SELECT x FROM Patient x WHERE x.nif = :nif", Patient.class)
                    .setParameter("nif", nif)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Patient> findByDoctor(Doctor doctor) {
        try {
            return em.createQuery("SELECT p FROM Patient p JOIN p.doctorPatientCollection dp WHERE dp.doctorID = :doctor", Patient.class)
                    .setParameter("doctor", doctor)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }

}
