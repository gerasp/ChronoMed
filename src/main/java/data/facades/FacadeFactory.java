package data.facades;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FacadeFactory {

    private static final ThreadLocal<Context> envCtx = new ThreadLocal<Context>() {
        @Override
        protected Context initialValue() {
            try {
                return (Context) new InitialContext().lookup("java:comp/env");
            } catch (NamingException e) {
                e.printStackTrace();
            }
            return null;
        }
    };

    public static <T extends AbstractFacade> T getFacade(String facade) {
        try {
            return (T) envCtx.get().lookup(facade);
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
