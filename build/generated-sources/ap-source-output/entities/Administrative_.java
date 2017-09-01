package entities;

import entities.Useraccount;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-21T11:30:32")
@StaticMetamodel(Administrative.class)
public class Administrative_ { 

    public static volatile SingularAttribute<Administrative, String> surname;
    public static volatile SingularAttribute<Administrative, Useraccount> userAccountID;
    public static volatile SingularAttribute<Administrative, String> name;
    public static volatile SingularAttribute<Administrative, String> nif;
    public static volatile SingularAttribute<Administrative, Integer> id;

}