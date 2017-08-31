/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Medicalhistory;
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
public class MedicalhistoryFacade extends AbstractFacade<Medicalhistory> {

    public MedicalhistoryFacade() {
        super(Medicalhistory.class);
    }
    
    public List<Medicalhistory> findByPatient(Patient patient){
        try {
            return  getEntityManager().createQuery("SELECT x FROM Medicalhistory x WHERE x.patientID = :patient", Medicalhistory.class)
                    .setParameter("patient", patient).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
}
