package presentation.command;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class FrontCommand {

    protected ServletContext context;
    protected HttpServletRequest request;
    protected HttpServletResponse response;

    public void init(ServletContext context, HttpServletRequest request, HttpServletResponse response) {
        this.context = context;
        this.request = request;
        this.response = response;
    }

    abstract public void process();

    public void forward(String target) {
        try {
            response.sendRedirect((request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getRequestURI())) +target));
        } catch (IOException ex) {
            Logger.getLogger(FrontCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
