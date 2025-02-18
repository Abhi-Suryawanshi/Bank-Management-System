package com.bankingsystem.util;

public class TestMail {
	public static void main(String[] args) {
		String to = "sameerrautspr@gmail.com";
		String subject = "Your Login Credentials for OnlineBanking";
		StringBuilder sb = new StringBuilder();
		sb.append("Your UserName is : Sameer123");
		sb.append("Password : 1245");
		sb.append("Thank you for using Fragile Online Banking System.!!!");
		try {
			SendEmail.sendMail(to, subject, sb.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
