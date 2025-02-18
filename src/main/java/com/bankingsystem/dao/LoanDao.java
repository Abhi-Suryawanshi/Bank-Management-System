package com.bankingsystem.dao;

import java.util.Collection;

import com.bankingsystem.entity.LoanEntity;

public interface LoanDao {

	public String createLoan(LoanEntity lEntity) throws Exception;
	public String updateLoan(LoanEntity lEntity) throws Exception;
	public String deleteLoan(int loanId) throws Exception;
	public LoanEntity findByLoanId(int loanId) throws Exception;
	public Collection<LoanEntity> getAllLoans() throws Exception;
}
