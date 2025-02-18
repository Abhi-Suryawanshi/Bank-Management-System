package com.bankingsystem.util;

import java.io.InputStream;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail {
	static Session newSession = null;
	static MimeMessage mimeMessage = null;
	static Properties prop = new Properties();
	/*public static void main(String[] args) throws Exception {
		SendEmail m = new SendEmail();
		m.setUpServerProperties();
		m.draftEmail();
		m.sendMail();
	}*/
	
	
	public static void sendMail(String to,String subject,String emailBody) throws Exception {
		setUpServerProperties();
		draftEmail(to,subject,emailBody);
		sendMail();
	}
	
	
	
	
	private static void setUpServerProperties() {
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		//prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		newSession = Session.getDefaultInstance(prop,null);
	}
	
	private static MimeMessage draftEmail(String to,String subject,String emailBody) throws Exception {
		mimeMessage = new MimeMessage(newSession);
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(emailBody);
		/*
		 * MimeBodyPart bdyprt = new MimeBodyPart();
		 * bdyprt.setContent(emailBody.toString(),"html/text"); MimeMultipart multpart =
		 * new MimeMultipart(); multpart.addBodyPart(bdyprt);
		 * mimeMessage.setContent(multpart);
		 */
		return mimeMessage;
	}
	
	private static void sendMail() throws Exception{
		
		//String from = "fragiletechnology@gmail.com";
		//String pwd = "zqmx wuhp aqmb ictv";
		InputStream dbstream=DataConnection.class.getClassLoader().getResourceAsStream("config.properties");
		prop.load(dbstream);
		String from=prop.getProperty("SENDER_EMAIL");
		System.out.println("from===>"+from);
		String pwd = prop.getProperty("SENDER_PASSWORD");
		String host = "smtp.gmail.com";
		Transport transport = newSession.getTransport("smtp");
		transport.connect(host, from, pwd);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
		System.out.println("Email Sent Successfully.!!");
	}
	
}
