
import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;

import java.io.File;


public final class Main {

    public static void main(final String[] args) throws Exception {

        final Tomcat tomcat = new Tomcat();

        tomcat.setPort(Integer.valueOf(System.getenv("PORT")));
//        tomcat.setPort(8000);
        tomcat.enableNaming();

        Context ctx = tomcat.addWebapp("/", new File("web/").getAbsolutePath());
        ctx.setConfigFile(new File("./META-INF/context.xml").toURI().toURL());

        tomcat.start();
        tomcat.getServer().await();
    }



}