/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Useraccount;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author alour
 */
@Stateless
public class UseraccountFacade extends AbstractFacade<Useraccount> {

    @PersistenceContext(unitName = "ChronoMedPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UseraccountFacade() {
        super(Useraccount.class);
    }
    
    public Useraccount checkLogin(String email, String password){
        try {
            return (Useraccount) em.createQuery("SELECT x FROM Useraccount x WHERE x.email = :email AND x.password = :password")
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
            
        } catch (Exception e) {
            return null;
        }
    }
    
}
