
import java.io.File;

import org.apache.catalina.startup.Tomcat;

public final class Main {

    public static void main(final String[] args) throws Exception {
        final Tomcat tomcat = new Tomcat();

//        tomcat.setPort(Integer.valueOf(System.getenv("PORT")));
        tomcat.setPort(8000);

        tomcat.addWebapp("/", new File("web/").getAbsolutePath());

        tomcat.start();

        tomcat.getServer().await();
    }

}