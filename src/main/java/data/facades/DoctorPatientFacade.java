/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Doctor;
import data.entities.DoctorPatient;
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
public class DoctorPatientFacade extends AbstractFacade<DoctorPatient> {

    public DoctorPatientFacade() {
        super(DoctorPatient.class);
    }

    public DoctorPatient findByPatientAndDoctor(Patient patient, Doctor doctor) {
        try {
            return getEntityManager().createQuery("SELECT x FROM DoctorPatient x WHERE x.patientID = :patientID AND x.doctorID = :doctorID", DoctorPatient.class)
                    .setParameter("patientID", patient)
                    .setParameter("doctorID", doctor)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<DoctorPatient> findByPatient(Patient patient) {
        try {
            return getEntityManager().createQuery("SELECT x FROM DoctorPatient x WHERE x.patientID = :patientID", DoctorPatient.class)
                    .setParameter("patientID", patient)
                    .getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
}
