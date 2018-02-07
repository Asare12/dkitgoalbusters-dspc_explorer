/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.services;

import com.sun.mail.util.MailSSLSocketFactory;
import java.security.GeneralSecurityException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Abdul
 */
public class EmailServices {

    Properties properties;
    String host;
    int port;
    String from;
    String password;

    public EmailServices() throws GeneralSecurityException {
        // Mail SMTP settings for Gmail ****************
        /*this.host = "smtp.gmail.com";
        this.port = 587;
        this.from = "savan.blackandwhite@gmail.com";
        this.password = "Me@savanmathew123";
        this.properties = System.getProperties();
        this.properties.put("mail.transport.protocol", "smtp");
        this.properties.put("mail.smtp.starttls.enable", "true");
        this.properties.put("mail.smtp.host", this.host);
        this.properties.put("mail.smtp.user", this.from);
        this.properties.put("mail.smtp.password", this.password);
        this.properties.put("mail.smtp.port", this.port);
        this.properties.put("mail.smtp.auth", "true");*/

        // SMTP Settings for SecureServer (Goddaddy Mails)*********
        this.host = "smtpout.europe.secureserver.net";
        this.port = 465;
        this.from = "abdulofficial2017@gmail.com";
        this.password = "Password"; //--- enter password here 
        this.properties = System.getProperties();
        this.properties.put("mail.transport.protocol", "smtps");
        this.properties.put("mail.smtps.starttls.enable", "true");
        this.properties.put("mail.smtps.host", this.host);
        this.properties.put("mail.smtps.user", this.from);
        this.properties.put("mail.smtp.user", this.from);
        this.properties.put("mail.smtps.password", this.password);
        this.properties.put("mail.smtps.port", this.port);
        this.properties.put("mail.smtps.auth", "true");
        MailSSLSocketFactory socketFactory = new MailSSLSocketFactory();
        // socketFactory.setTrustedHosts(new String[]{"my-server"});
        socketFactory.setTrustAllHosts(true);
        this.properties.put("mail.smtps.socketFactory", socketFactory);

    }

    public boolean sendMail(String[] to, String subject, String messageBody, String fileName, DataSource source) {
        // Get the default Session object.
        Session session = Session.getDefaultInstance(this.properties);
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress((String) this.properties.get("mail.smtp.user")));

            // Set To: Set all email addresses in to String Array as receipients of email
            for (String to1 : to) {
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to1));
            }

            // Set Subject: header field
            message.setSubject(subject);

            // Create the message part 
            BodyPart messageBodyPart = new MimeBodyPart();

            // Fill the message
            messageBodyPart.setText(messageBody);

            // Create a multipar message
            Multipart multipart = new MimeMultipart();

            // Set text message part
            multipart.addBodyPart(messageBodyPart);

            // Part two is attachment
            if (fileName != null && source != null) {
                messageBodyPart = new MimeBodyPart();
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName(fileName);
                multipart.addBodyPart(messageBodyPart);
            }
            // Send the complete message parts
            message.setContent(multipart);
            // Send message
            message.setContent(messageBody, "text/html");
            Transport transport = session.getTransport();
            transport.connect(this.host, this.port, this.from, this.password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return true;
        } catch (MessagingException | IllegalStateException | NullPointerException mex) {
            mex.printStackTrace();
            return false;
        }
    }
}
