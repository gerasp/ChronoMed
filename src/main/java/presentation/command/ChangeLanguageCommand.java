package presentation.command;

public class ChangeLanguageCommand extends FrontCommand {

    @Override
    public void process() {
        request.getSession().setAttribute("language",request.getParameter("language"));
        forward("/");
    }

}
