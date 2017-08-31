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
import javax.persistence.PersistenceContext;

/**
 *
 * @author alour
 */
@Stateless
public class DoctorFacade extends AbstractFacade<Doctor> {

    @PersistenceContext(unitName = "ChronoMedPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DoctorFacade() {
        super(Doctor.class);
    }
    
    public Doctor findByAccount(Useraccount user){
        try {
            return em.createQuery("SELECT x FROM Doctor x WHERE x.userAccountID = :userID", Doctor.class)
                    .setParameter("userID", user)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Doctor> findByBoardNumber(String boardNumber){
        try {
            return  em.createQuery("SELECT x FROM Doctor x WHERE x.boardNumber = :boardNumber", Doctor.class)
                    .setParameter("boardNumber", boardNumber).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Doctor> findByPatient(Patient patient) {
        try {
            return em.createQuery("SELECT d FROM Doctor d JOIN d.doctorPatientCollection dp WHERE dp.patientID = :patient", Doctor.class)
                    .setParameter("patient", patient)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
