package com.bankingsystem.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import com.bankingsystem.dao.CustomerDao;
import com.bankingsystem.entity.CustomerEntity;
import com.bankingsystem.util.DataConnection;

public class CustomerDaoImpl implements CustomerDao {
	Connection con = DataConnection.getConnection();
	private CustomerDaoImpl () {}
	private static CustomerDaoImpl instance = null;
	public static CustomerDaoImpl getInstance() {
		if(instance==null) {
			instance=new CustomerDaoImpl();
		}
		return instance;
	}
	
	@Override
	public String createCustomer(CustomerEntity cEntity) throws Exception {
		PreparedStatement pst = con.prepareStatement("insert into customer_details(full_name,password,contact,email,user_name,dob,address,custom_v1,custom_v2,custom_v3,custom_n1,custom_n2,custom_n3) values ( ?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, cEntity.getName());
		pst.setString(2, "123123");
		pst.setLong(3, cEntity.getContact());
		pst.setString(4, cEntity.getEmail());
		pst.setString(5, cEntity.getUserName());
		pst.setString(6, cEntity.getDob());
		pst.setString(7, cEntity.getAddress());
		pst.setString(8, cEntity.getCustomV1());
		pst.setString(9, cEntity.getCustomV2());
		pst.setString(10, cEntity.getCustomV3());
		pst.setInt(11, cEntity.getCustomN1());
		pst.setInt(12, cEntity.getCustomN2());
		pst.setInt(13, cEntity.getCustomN3());
		int status = pst.executeUpdate();
		return status > 0 ? "success" : "error" ;
		
		
	}

	@Override
	public CustomerEntity checkCustomer(String userName, String pwd) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from customer_details where user_name=? and password=?");
		pst.setString(1, userName);
		pst.setString(2, pwd);
		ResultSet rs = pst.executeQuery();
		CustomerEntity custEntity = null;
		while(rs.next()) {
			custEntity = new CustomerEntity();
			custEntity.setCustId(rs.getInt("Cust_id"));
			custEntity.setName(rs.getString("full_name"));
			custEntity.setPassword(rs.getString("password"));
			custEntity.setAddress(rs.getString("address"));
			custEntity.setContact(rs.getLong("contact"));
			custEntity.setEmail(rs.getString("email"));
			custEntity.setUserName(rs.getString("user_name"));
			custEntity.setDob(rs.getString("dob"));
			custEntity.setCustomV1(rs.getString("custom_v1"));
			custEntity.setCustomV2(rs.getString("custom_v2"));
			custEntity.setCustomV3(rs.getString("custom_v3"));
			custEntity.setCustomN1(rs.getInt("custom_n1"));
			custEntity.setCustomN2(rs.getInt("custom_n2"));
			custEntity.setCustomN3(rs.getInt("custom_n3"));
		}
		return custEntity;
	}

	@Override
	public Collection<CustomerEntity> getAllCostomer() throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from customer_details");
		ResultSet rs = pst.executeQuery();
		Collection<CustomerEntity> Entities = new ArrayList<CustomerEntity>();
		while(rs.next()) {
			CustomerEntity custEntity = new CustomerEntity();
			custEntity.setCustId(rs.getInt("Cust_id"));
			custEntity.setName(rs.getString("full_name"));
			custEntity.setPassword(rs.getString("password"));
			custEntity.setAddress(rs.getString("address"));
			custEntity.setContact(rs.getLong("contact"));
			custEntity.setEmail(rs.getString("email"));
			custEntity.setUserName(rs.getString("user_name"));
			custEntity.setDob(rs.getString("dob"));
			custEntity.setCustomV1(rs.getString("custom_v1"));
			custEntity.setCustomV2(rs.getString("custom_v2"));
			custEntity.setCustomV3(rs.getString("custom_v3"));
			custEntity.setCustomN1(rs.getInt("custom_n1"));
			custEntity.setCustomN2(rs.getInt("custom_n2"));
			custEntity.setCustomN3(rs.getInt("custom_n3"));
			
			Entities.add(custEntity);
		}
			
		return Entities;
	}

	@Override
	public CustomerEntity findByCustId(int custId) throws Exception {
		PreparedStatement pst = con.prepareStatement("select * from customer_details where Cust_id=?");
		pst.setInt(1, custId);
		ResultSet rs = pst.executeQuery();
		CustomerEntity custEntity = null;
		while(rs.next()) {
			custEntity = new CustomerEntity();
			custEntity.setCustId(rs.getInt("Cust_id"));
			custEntity.setName(rs.getString("full_name"));
			custEntity.setPassword(rs.getString("password"));
			custEntity.setAddress(rs.getString("address"));
			custEntity.setContact(rs.getLong("contact"));
			custEntity.setEmail(rs.getString("email"));
			custEntity.setUserName(rs.getString("user_name"));
			custEntity.setDob(rs.getString("dob"));
			custEntity.setAadhar(rs.getString("aadhar_number"));
			custEntity.setPan(rs.getString("pan_number"));
			custEntity.setAccountType(rs.getString("account_type"));
			custEntity.setIfsc(rs.getString("ifsc"));
			custEntity.setBranch(rs.getString("branch"));
			custEntity.setOccupation(rs.getString("occupation"));
			custEntity.setGender(rs.getString("gender"));
			custEntity.setNominee(rs.getString("nominee"));
			custEntity.setCustomV1(rs.getString("custom_v1"));
			custEntity.setCustomV2(rs.getString("custom_v2"));
			custEntity.setCustomV3(rs.getString("custom_v3"));
			custEntity.setCustomN1(rs.getInt("custom_n1"));
			custEntity.setCustomN2(rs.getInt("custom_n2"));
			custEntity.setCustomN3(rs.getInt("custom_n3"));
		}
			
		return custEntity;
	}

	@Override
	public String updateCustomer(CustomerEntity cEntity) throws Exception {
		PreparedStatement pst = con.prepareStatement("update customer_details set full_name = ?,password = ?,contact = ?,email = ?,aadhar_number = ?,pan_number = ?,user_name = ?,address = ?,dob = ?,account_type = ?,ifsc = ?,branch = ?,occupation = ?,gender = ?,nominee = ?,custom_v1 = ?,custom_v2 = ?,custom_v3 = ?,custom_n1 = ?,custom_n2 = ?,custom_n3 = ?  where Cust_id = ?");
		pst.setString(1, cEntity.getName());
		pst.setString(2, cEntity.getPassword());
		pst.setLong(3, cEntity.getContact());
		pst.setString(4, cEntity.getEmail());
		pst.setString(5, cEntity.getAadhar());
		pst.setString(6, cEntity.getPan());
		pst.setString(7, cEntity.getUserName());
		pst.setString(8, cEntity.getAddress());
		pst.setString(9, cEntity.getDob());
		pst.setString(10, cEntity.getAccountType());
		pst.setString(11, cEntity.getIfsc());
		pst.setString(12, cEntity.getBranch());
		pst.setString(13, cEntity.getOccupation());
		pst.setString(14, cEntity.getGender());
		pst.setString(15, cEntity.getNominee());
		pst.setString(16, cEntity.getCustomV1());
		pst.setString(17, cEntity.getCustomV2());
		pst.setString(18, cEntity.getCustomV3());
		pst.setInt(19, cEntity.getCustomN1());
		pst.setInt(20, cEntity.getCustomN2());								
		pst.setInt(21, cEntity.getCustomN3());
		pst.setInt(22, cEntity.getCustId());
		int status = 0;
		try {
			status = pst.executeUpdate();
			System.out.println(status);
		} catch (Exception e) {
			System.out.println("MSG==>"+e.getMessage());
		}
		return status > 0 ? "success" : "error" ;
	}

	@Override
	public String deleteCustomer(int custId) throws Exception {
		int status = 0;
		PreparedStatement pst = con.prepareStatement("delete from  customer_details where Cust_id=?");
		pst.setInt(1, custId);
		status = pst.executeUpdate();
		return status > 0 ? "success" : "error" ;
	}

	@Override
	public String approveCustomer(int custId) throws Exception {
		int status = 0;
		PreparedStatement pst = con.prepareStatement("update customer_details set custom_n1=1 where Cust_id=?");
		pst.setInt(1, custId);
		status = pst.executeUpdate();
		return status > 0 ? "success" : "error" ;
	}

	@Override
	public int customerCount() throws Exception {
		PreparedStatement pst = con.prepareStatement("select count(*) as customer_details from customer_details");
		ResultSet rs = pst.executeQuery();
		int customerCount = 0;
		while(rs.next()) {
			customerCount = rs.getInt("customer_details");
		}
		return customerCount;
	}

	@Override
	public int customerApproveCount() throws Exception {
		PreparedStatement pst = con.prepareStatement("select count(*) as custom_n1 from customer_details where custom_n1 >0");
		ResultSet rs = pst.executeQuery();
		int approvConut = 0;
		while(rs.next()) {
			approvConut = rs.getInt("custom_n1");
		}
		return approvConut;
	}

}
