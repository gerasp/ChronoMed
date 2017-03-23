package command;

//import entities.Useraccount;
//import facades.UseraccountFacade;
import entities.Useraccount;
import facades.UseraccountFacade;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class BeanCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            UseraccountFacade useraccountFacade = InitialContext.doLookup("java:global/ChronoMed/UseraccountFacade");
            
            final Useraccount useraccountObject = getUseraccountObject();
            useraccountFacade.create(useraccountObject);
            
            request.setAttribute("accounts", useraccountObject.toString());
        } catch (NamingException ex) {
            request.setAttribute("accounts", "ERROR EN BD");
        }

        forward("/index.jsp");
    }

    private Useraccount getUseraccountObject() {
        Useraccount account = new Useraccount();
        account.setEmail("swagBoi@gmail.com");
        account.setPassword("sigarrito");
        account.setActive(true);
        return account;
    }
}
