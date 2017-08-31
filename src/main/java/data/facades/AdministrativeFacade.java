/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.facades;

import data.entities.Administrative;
import data.entities.Useraccount;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author alour
 */
@Stateless
public class AdministrativeFacade extends AbstractFacade<Administrative> {

    @PersistenceContext(unitName = "ChronoMedPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdministrativeFacade() {
        super(Administrative.class);
    }
    
    
    public Administrative findByAccount(Useraccount user){
        try {
            return em.createQuery("SELECT x FROM Administrative x WHERE x.userAccountID = ?1", Administrative.class)
                    .setParameter(1, user)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
