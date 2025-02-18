package com.bankingsystem.util;

import java.time.LocalDate;
import java.time.Period;


public class Test {
	public static void main(String args[])  
	{  
	//obtains an instance of LocalDate from a year, month and date  
	LocalDate dob = LocalDate.of(2001, 03, 16);  
	//obtains the current date from the system clock  
	LocalDate curDate = LocalDate.now();  
	//calculates the difference betwween two dates  
	Period period = Period.between(dob, curDate);  
	//prints the differnce in years, months, and days  
	System.out.printf("Your age is %d years %d months and %d days.", period.getYears(), period.getMonths(), period.getDays());  
	}  
}
