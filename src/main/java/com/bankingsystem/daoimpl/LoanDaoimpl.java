package com.bankingsystem.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

import com.bankingsystem.dao.LoanDao;
import com.bankingsystem.entity.LoanEntity;
import com.bankingsystem.util.DataConnection;

public class LoanDaoimpl implements LoanDao{
	
	Connection con = DataConnection.getConnection();
	private LoanDaoimpl () {}
	private static LoanDaoimpl instance = null;
	public static LoanDaoimpl getInstance() {
		if(instance==null) {
			instance=new LoanDaoimpl();
		}
		return instance;
	}

	@Override
	public String createLoan(LoanEntity lEntity) throws Exception {
		PreparedStatement pst = con.prepareStatement("insert into balance_details(balance,home_loan_amt,personal_loan_amt,car_loan_amt,credit_card_amt) values(?,?,?,?,?);");
		pst.setDouble(1, lEntity.getBalance());
		pst.setDouble(2, lEntity.getHomeLoanAmt());
		pst.setDouble(3, lEntity.getPersonalLoanAmt());
		pst.setDouble(4, lEntity.getCarLoanAmt());
		pst.setDouble(5, lEntity.getCreditCardAmt());
		int status = pst.executeUpdate();
		return status > 0 ? "success" : "error";
	}

	@Override
	public String updateLoan(LoanEntity lEntity) throws Exception {
		PreparedStatement pst = con.prepareStatement("update balance_details set balance = ?, home_loan_amt = ?, personal_loan_amt = ?, car_loan_amt = ?, credit_card_amt = ? where loan_id = ?");
		pst.setDouble(1, lEntity.getBalance());
		pst.setDouble(2, lEntity.getHomeLoanAmt());
		pst.setDouble(3, lEntity.getPersonalLoanAmt());
		pst.setDouble(4, lEntity.getCarLoanAmt());
		pst.setDouble(5, lEntity.getCreditCardAmt());
		int status = pst.executeUpdate();
		return status > 0 ? "success" : "error";
	}

	@Override
	public String deleteLoan(int loanId) throws Exception {
		int status = 0;
		PreparedStatement pst = con.prepareStatement("delete from balance_details where loan_id =?");
		pst.setInt(1, loanId);
		status = pst.executeUpdate();
		return status > 0 ? "success" : "error";
	}

	@Override
	public LoanEntity findByLoanId(int loanId) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from balance_details where loan_id = ?");
		pst.setInt(1, loanId);
		ResultSet rs = pst.executeQuery();
		LoanEntity lEntity = null;
		while (rs.next()) {
			lEntity = new LoanEntity();
			lEntity.setBalance(rs.getDouble("balance"));
			lEntity.setHomeLoanAmt(rs.getDouble("home_loan_amt"));
			lEntity.setPersonalLoanAmt(rs.getDouble("personal_loan_amt"));
			lEntity.setCarLoanAmt(rs.getDouble("car_loan_amt"));
			lEntity.setCreditCardAmt(rs.getDouble("credit_card_amt"));
		}
		return lEntity;
	}

	@Override
	public Collection<LoanEntity> getAllLoans() throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from balance_details");
		ResultSet rs = pst.executeQuery();
		Collection<LoanEntity> Entities = new ArrayList<LoanEntity>();
		while (rs.next()) {
			LoanEntity lEntity = new LoanEntity();
			lEntity.setBalance(rs.getDouble("balance"));
			lEntity.setHomeLoanAmt(rs.getDouble("home_loan_amt"));
			lEntity.setPersonalLoanAmt(rs.getDouble("personal_loan_amt"));
			lEntity.setCarLoanAmt(rs.getDouble("car_loan_amt"));
			lEntity.setCreditCardAmt(rs.getDouble("credit_card_amt"));
			
			Entities.add(lEntity);
		}
		return Entities;
	}

}
