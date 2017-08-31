package business.utils;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

    static String emailFrom = "xg.2012.team@gmail.com"; // USER
    static String password = "extremegaming";       // PASS
    static String emailTo = null;
    static String subject = null;
    static String body = null;

    static Properties mailServerProperties;
    static Session getMailSession;

    private static void send() {
        try {
            setServerProperties();
            setMailSession();
            Transport.send(generateMimeMessage());
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public static void sendMail(String recipient, String subject, String body) {
        Email.emailTo = recipient;
        Email.subject = subject;
        Email.body = body;
        send();
    }

    private static MimeMessage generateMimeMessage() throws MessagingException, UnsupportedEncodingException {
        MimeMessage generateMailMessage = new MimeMessage(getMailSession);
        generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(Email.emailTo));
        generateMailMessage.setSubject(Email.subject);
        generateMailMessage.setContent(Email.body, "text/html; charset=UTF-8");
        generateMailMessage.setFrom(new InternetAddress(emailFrom, "ChronoMed"));
        return generateMailMessage;
    }

    // set connection properties
    private static void setServerProperties() {
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.host", "smtp.gmail.com");
        mailServerProperties.put("mail.smtp.socketFactory.port", "465");
        mailServerProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.port", "465");
    }

    // set session properties (authentication)
    private static void setMailSession() {
        getMailSession = Session.getInstance(mailServerProperties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Email.emailFrom, Email.password);
            }
        });
    }

    public static void sendUserAccount(String email, String password, String name, String surname) {
        Email.emailTo = "oscky-go@hotmail.com";
        Email.subject = "Bienvenido a ChronoMed";
        Email.body = String.format(getEmailTemplateUserAccounts(), surname + ", " + name, email, password);
        send();
    }
    
    public static void sendNotification(String author, String type, String email) {
        Email.emailTo = "oscky-go@hotmail.com";
        Email.subject = "Notificación";
        Email.body = String.format(getEmailTemplateNotifications(), author, type);
        send();
    }

    private static String getEmailTemplateUserAccounts() {
        return "<html><body style=\"width: 1450px;max-height: 680px;margin: 0;font-family: arial;\">\n"
                + "		<div><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-sup.png\"></div>\n"
                + "		<div style=\"margin-top:-3px\">\n"
                + "			<div style=\"display: inline-block;float: left;\"><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-izq.png\"></div>\n"
                + "			<div style=\"width: 626px;height: 278px;display: inline-block;float: left;\">\n"
                + "				<h2 style=\"margin-top: 7px;\">¡Bienvenido Sr./Sra. %s!</h2>\n"
                + "				<p>Sus credenciales para acceder son: </p>\n"
                + "				<div style=\"margin: 25px;\">\n"
                + "					<strong>Usuario : </strong> <span>%s</span> <br>\n"
                + "					<strong>Contraseña : </strong> <span>%s</span>\n"
                + "				</div>\n"
                + "				<p>Cordiales saludos del equipo de desarrollo de ChronoMed</p>\n"
                + "				<div style=\"text-align: center;margin-top: 50px;\">\n"
                + "					<a href=\"mailto:j.arencibiacusters@gmail.com?subject=Servicio Técnico\" style=\"color: #396c44;text-transform: initial;text-decoration: none;\">\n"
                + "						Si tiene algún problema o desea consultar algo, contacte con nuestro servicio técnico 24h</a>\n"
                + "				</div>\n"
                + "			</div>\n"
                + "			<div style=\"display: inline-block;float: left;\"><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-der.png\" style=\"\"></div>\n"
                + "		</div>\n"
                + "		<div style=\"margin-top:-3px\"><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-inf.png\"></div>\n"
                + "</body></html>";
    }
    
    private static String getEmailTemplateNotifications() {
        return "<html><body style=\"width: 1450px;max-height: 680px;margin: 0;font-family: arial;\">\n"
                + "		<div><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-sup.png\"></div>\n"
                + "		<div style=\"margin-top:-3px\">\n"
                + "			<div style=\"display: inline-block;float: left;\"><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-izq.png\"></div>\n"
                + "			<div style=\"width: 626px;height: 278px;display: inline-block;float: left;\">\n"
                + "				<h2 style=\"margin-top: 7px;\">Notificación</h2>\n"
                + "				<div style=\"margin: 25px;\">\n"
                + "					%s ha realizado %s"
                + "				</div>\n"
                + "				<p>Cordiales saludos del equipo de desarrollo de ChronoMed</p>\n"
                + "				<div style=\"text-align: center;margin-top: 50px;\">\n"
                + "					<a href=\"mailto:j.arencibiacusters@gmail.com?subject=Servicio Técnico\" style=\"color: #396c44;text-transform: initial;text-decoration: none;\">\n"
                + "						Si tiene algún problema o desea consultar algo, contacte con nuestro servicio técnico 24h</a>\n"
                + "				</div>\n"
                + "			</div>\n"
                + "			<div style=\"display: inline-block;float: left;\"><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-der.png\" style=\"\"></div>\n"
                + "		</div>\n"
                + "		<div style=\"margin-top:-3px\"><img src=\"http://mealtera.com:8080/ChronoMed/images/email/bg-inf.png\"></div>\n"
                + "</body></html>";
    }
}
