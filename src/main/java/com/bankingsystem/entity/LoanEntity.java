package com.bankingsystem.entity;

public class LoanEntity {

	private int loanId;
	private double balance;
	private double homeLoanAmt;
	private double personalLoanAmt;
	private double carLoanAmt;
	private double creditCardAmt;
	
	public int getBalId() {
		return loanId;
	}
	public void setBalId(int balId) {
		this.loanId = balId;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public double getHomeLoanAmt() {
		return homeLoanAmt;
	}
	public void setHomeLoanAmt(double homeLoanAmt) {
		this.homeLoanAmt = homeLoanAmt;
	}
	public double getPersonalLoanAmt() {
		return personalLoanAmt;
	}
	public void setPersonalLoanAmt(double personalLoanAmt) {
		this.personalLoanAmt = personalLoanAmt;
	}
	public double getCarLoanAmt() {
		return carLoanAmt;
	}
	public void setCarLoanAmt(double carLoanAmt) {
		this.carLoanAmt = carLoanAmt;
	}
	public double getCreditCardAmt() {
		return creditCardAmt;
	}
	public void setCreditCardAmt(double creditCardAmt) {
		this.creditCardAmt = creditCardAmt;
	}
	
}
