package com.bankingsystem.dao;

import java.util.Collection;

import com.bankingsystem.entity.CustomerEntity;

public interface CustomerDao {

	public String createCustomer(CustomerEntity cEntity) throws Exception;
	public String updateCustomer(CustomerEntity cEntity) throws Exception;
	public String deleteCustomer(int custId) throws Exception;
	public Collection<CustomerEntity> getAllCostomer() throws Exception;
	public CustomerEntity findByCustId(int custId) throws Exception;
	public CustomerEntity checkCustomer(String userName ,String pwd) throws Exception;
	public String approveCustomer(int custId) throws Exception;
	public int customerCount() throws Exception;
	public int customerApproveCount() throws Exception;
}
