package data.facades;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FacadeFactory {

    public static <T extends AbstractFacade> T getFacade(String entityName) {

        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            AbstractFacade abstractFacade = (AbstractFacade) envCtx.lookup(entityName);

            Class clase = Class.forName("data.facades."+entityName);
            return (T) clase.cast(abstractFacade);
        } catch (NamingException ex) {
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
