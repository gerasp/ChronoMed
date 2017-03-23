package entities;

import entities.DoctorPatient;
import entities.Useraccount;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-21T11:30:32")
@StaticMetamodel(Doctor.class)
public class Doctor_ { 

    public static volatile SingularAttribute<Doctor, String> speciality;
    public static volatile SingularAttribute<Doctor, Integer> phoneNumber;
    public static volatile SingularAttribute<Doctor, String> gender;
    public static volatile SingularAttribute<Doctor, String> surname;
    public static volatile SingularAttribute<Doctor, Useraccount> userAccountID;
    public static volatile SingularAttribute<Doctor, String> name;
    public static volatile CollectionAttribute<Doctor, DoctorPatient> doctorPatientCollection;
    public static volatile SingularAttribute<Doctor, String> nif;
    public static volatile SingularAttribute<Doctor, Integer> boardNumber;
    public static volatile SingularAttribute<Doctor, Integer> id;
    public static volatile SingularAttribute<Doctor, Integer> alternativePhoneNumber;

}