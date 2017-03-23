package entities;

import entities.DoctorPatient;
import entities.Healthcard;
import entities.Useraccount;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-21T11:30:32")
@StaticMetamodel(Patient.class)
public class Patient_ { 

    public static volatile SingularAttribute<Patient, Integer> zipCode;
    public static volatile SingularAttribute<Patient, String> country;
    public static volatile SingularAttribute<Patient, String> address;
    public static volatile SingularAttribute<Patient, String> gender;
    public static volatile SingularAttribute<Patient, String> locality;
    public static volatile SingularAttribute<Patient, String> nif;
    public static volatile SingularAttribute<Patient, Date> birthDate;
    public static volatile SingularAttribute<Patient, Integer> alternativePhoneNumber;
    public static volatile CollectionAttribute<Patient, Healthcard> healthcardCollection;
    public static volatile SingularAttribute<Patient, Integer> phoneNumber;
    public static volatile SingularAttribute<Patient, String> nationality;
    public static volatile SingularAttribute<Patient, String> province;
    public static volatile SingularAttribute<Patient, String> surname;
    public static volatile SingularAttribute<Patient, Useraccount> userAccountID;
    public static volatile SingularAttribute<Patient, String> name;
    public static volatile CollectionAttribute<Patient, DoctorPatient> doctorPatientCollection;
    public static volatile SingularAttribute<Patient, Integer> id;

}