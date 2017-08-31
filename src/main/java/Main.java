
import java.io.File;
import java.net.URL;

import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public final class Main {

    public static void main(final String[] args) throws Exception {

        final Tomcat tomcat = new Tomcat();

//        tomcat.setPort(Integer.valueOf(System.getenv("PORT")));
        tomcat.setPort(8000);
        tomcat.enableNaming();

        Context ctx = tomcat.addWebapp("/", new File("web/").getAbsolutePath());
        ctx.setConfigFile(new URL("file:///home/gerardo/Schreibtisch/javaeesample-heroku/META-INF/context.xml"));
//
//        SessionFactory sessionFactory = new Configuration()
//                .configure("/hibernate.cfg.xml")
//                .buildSessionFactory();

        tomcat.start();


        tomcat.getServer().await();
    }


}