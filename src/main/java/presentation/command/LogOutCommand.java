package presentation.command;

public class LogOutCommand extends FrontCommand {

    @Override
    public void process() {
        request.getSession().invalidate();
        forward("/");
    }

}
