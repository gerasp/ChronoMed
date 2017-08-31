/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Healthcard;
import data.entities.Patient;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author alour
 */
@Stateless
public class HealthcardFacade extends AbstractFacade<Healthcard> {

    @PersistenceContext(unitName = "ChronoMedPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HealthcardFacade() {
        super(Healthcard.class);
    }

    public Healthcard findByPatientAndNumber(Patient patient, String healthcardNumber) {
        try {
            return em.createQuery("SELECT x FROM Healthcard x WHERE x.patientID = :patientID AND x.number = :number", Healthcard.class)
                    .setParameter("number", healthcardNumber)
                    .setParameter("patientID", patient)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Healthcard> findByPatient(Patient patient) {
        try {
            return em.createQuery("SELECT x FROM Healthcard x WHERE x.patientID = :patientID", Healthcard.class)
                    .setParameter("patientID", patient)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<Healthcard> findHealthCardByHealthCardNumber(String number){
        try {
            return em.createQuery("SELECT x FROM Healthcard x WHERE x.number = :number", Healthcard.class)
                    .setParameter("number", number)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
