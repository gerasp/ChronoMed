/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Medicalconsultation;
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
public class MedicalconsultationFacade extends AbstractFacade<Medicalconsultation> {

    public MedicalconsultationFacade() {
        super(Medicalconsultation.class);
    }
    
    public List<Medicalconsultation> findByPatient(Patient patient){
        try {
            return  getEntityManager().createQuery("SELECT x FROM Medicalconsultation x WHERE x.patientID = :patient ORDER BY x.date DESC", Medicalconsultation.class)
                    .setParameter("patient", patient).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
}
