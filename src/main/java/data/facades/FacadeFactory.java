package data.facades;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FacadeFactory {
    public static <T extends AbstractFacade> T getFacade(String facade) {
        Context initCtx = null;
        try {
            initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            return (T) envCtx.lookup(facade);
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
