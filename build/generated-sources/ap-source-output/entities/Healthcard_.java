package entities;

import entities.Patient;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-21T11:30:32")
@StaticMetamodel(Healthcard.class)
public class Healthcard_ { 

    public static volatile SingularAttribute<Healthcard, Integer> number;
    public static volatile SingularAttribute<Healthcard, Patient> patientID;
    public static volatile SingularAttribute<Healthcard, Integer> id;

}