package presentation.command;

public class LogoutCommand extends FrontCommand {

    @Override
    public void process() {
        request.getSession().invalidate();
        forward("/");
    }

}
