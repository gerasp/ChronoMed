package entities;

import entities.Administrative;
import entities.Doctor;
import entities.Patient;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-21T11:30:32")
@StaticMetamodel(Useraccount.class)
public class Useraccount_ { 

    public static volatile SingularAttribute<Useraccount, String> password;
    public static volatile CollectionAttribute<Useraccount, Administrative> administrativeCollection;
    public static volatile SingularAttribute<Useraccount, Boolean> active;
    public static volatile CollectionAttribute<Useraccount, Doctor> doctorCollection;
    public static volatile CollectionAttribute<Useraccount, Patient> patientCollection;
    public static volatile SingularAttribute<Useraccount, Integer> id;
    public static volatile SingularAttribute<Useraccount, String> email;

}