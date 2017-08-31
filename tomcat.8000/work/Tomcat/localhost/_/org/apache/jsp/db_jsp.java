/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.50
 * Generated at: 2017-08-31 18:47:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import business.beans.ServerLifetimeBean;
import data.entities.Medicalconsultation;
import data.entities.Medicalhistory;
import data.entities.DoctorPatient;
import data.entities.Healthcard;
import java.text.SimpleDateFormat;
import data.entities.Patient;
import data.entities.Doctor;
import data.entities.Administrative;
import java.util.List;
import data.entities.Useraccount;
import javax.naming.InitialContext;
import javax.ejb.EJB;
import data.facades.*;
import javax.naming.Context;
import static javax.rmi.PortableRemoteObject.narrow;
import javax.sql.DataSource;
import java.sql.Connection;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public final class db_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>DB ChronoMed</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>El servidor lleva funcionando\n");
      out.write("        ");


            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");

            DataSource ds = (DataSource)
                    envCtx.lookup("jdbc/chronomed");
//
//            Connection conn = ds.getConnection();

            ServerLifetimeBean serverLifetimeBean = (ServerLifetimeBean) envCtx.lookup("ServerLifetimeBean");
            out.print(serverLifetimeBean.getTime());
        
      out.write("\n");
      out.write("        minutos</h1>\n");
      out.write("        <hr/>\n");
      out.write("\n");
      out.write("        <h1 style=\"margin-bottom:0;\">Base de datos: ChronoMed</h1>\n");
      out.write("\n");
      out.write("        <h1 style=\"margin-bottom:0;\">userAccount</h1>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <th>id</th>\n");
      out.write("                <th>email</th>\n");
      out.write("                <th>password</th>\n");
      out.write("                <th>active</th>\n");
      out.write("            </tr>\n");
      out.write("            ");


//                UseraccountFacade uaFacade = FacadeFactory.getFacade("Useraccount");
                UseraccountFacade uaFacade = (UseraccountFacade) envCtx.lookup("UseraccountFacade");
                List<Useraccount> userAccounts = uaFacade.findAll();

                for (Useraccount userAccount : userAccounts) {
                    out.println(
                            "<tr>"
                            + "<td>" + userAccount.getId() + "</td>"
                            + "<td>" + userAccount.getEmail() + "</td>"
                            + "<td>" + userAccount.getPassword() + "</td>"
                            + "<td>" + userAccount.getActive() + "</td>"
                            + "</tr>"
                    );
                }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("             ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
