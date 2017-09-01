package entities;

import entities.Doctor;
import entities.Patient;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-21T11:30:32")
@StaticMetamodel(DoctorPatient.class)
public class DoctorPatient_ { 

    public static volatile SingularAttribute<DoctorPatient, Doctor> doctorID;
    public static volatile SingularAttribute<DoctorPatient, Patient> patientID;
    public static volatile SingularAttribute<DoctorPatient, Integer> id;

}