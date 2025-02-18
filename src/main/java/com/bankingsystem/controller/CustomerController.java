package com.bankingsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bankingsystem.daoimpl.CustomerDaoImpl;
import com.bankingsystem.entity.CustomerEntity;
import com.bankingsystem.util.PasswordGenerator;
import com.bankingsystem.util.SendEmail;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docmd = request.getParameter("docmd");
		System.out.println("docmd===>"+docmd);
		String nextPage = "index.jsp";
		HttpSession session = request.getSession();
		if(docmd.equalsIgnoreCase("createCustomer")) {
			String name = request.getParameter("name");
			long contact = Long.parseLong(request.getParameter("contact"));
			String email = request.getParameter("email");
			String userName = request.getParameter("user");
			String dob = request.getParameter("dob");
			String address = request.getParameter("address");
			
			
			CustomerEntity custEntity = new CustomerEntity();
			custEntity.setName(name);
			custEntity.setContact(contact);
			custEntity.setEmail(email);
			custEntity.setUserName(userName);
			custEntity.setDob(dob);
			custEntity.setAddress(address);
			
			try {
				String result = CustomerDaoImpl.getInstance().createCustomer(custEntity);
				if(result.equals("success")) {
					request.setAttribute("success", "Your request submitted successfully.");
					nextPage = "index.jsp";
				}else {
					request.setAttribute("error", "Error Occured while submiting your request");
					nextPage = "index.jsp";
				}
			} catch (Exception e) {
			}
		}else if(docmd.equalsIgnoreCase("checkLoginCredentials")) {
			System.out.println("checkLoginCredentials");
			String userName = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			try {
				CustomerEntity custEntity=CustomerDaoImpl.getInstance().checkCustomer(userName, pwd);
				//System.out.println("custId=====>"+custEntity.getCustId());
				if (custEntity != null) {
					session.setAttribute("custId", custEntity.getCustId());
					nextPage="welcome.jsp";
				}else {
					nextPage = "index.jsp";
					request.setAttribute("error", "Please Enter Valid Credential to Proceed.");
				}
			} catch (Exception e) {
			}
			
		} else if(docmd.equalsIgnoreCase("updateCustomer")) {
				int CustId = request.getParameter("custId") != null ? Integer.parseInt(request.getParameter("custId")):0;
				String name = request.getParameter("fname");
				long contact = Long.parseLong(request.getParameter("contact"));
				String email = request.getParameter("email");
				String aadhar = request.getParameter("aadhar");
				String pan = request.getParameter("pan");
				String userName = request.getParameter("username");
				String address = request.getParameter("address");
				String dob = request.getParameter("dob");
				String accountType = request.getParameter("accountType");
				String ifsc = request.getParameter("ifsc");
				String branch = request.getParameter("branch");
				String occupation = request.getParameter("occupation");
				String gender = request.getParameter("gender");
				String nominee = request.getParameter("nominee");
				
				try {
					CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(CustId);
					custEntity.setName(name);
					custEntity.setContact(contact);
					custEntity.setEmail(email);
					custEntity.setAadhar(aadhar);
					custEntity.setPan(pan);
					custEntity.setUserName(userName);
					custEntity.setAddress(address);
					custEntity.setDob(dob);
					custEntity.setAccountType(accountType);
					custEntity.setIfsc(ifsc);
					custEntity.setBranch(branch.split("~")[0]);
					custEntity.setOccupation(occupation);
					custEntity.setGender(gender);
					custEntity.setNominee(nominee);
					String result = CustomerDaoImpl.getInstance().updateCustomer(custEntity);
					
					if(result.equals("success")) {
						request.setAttribute("success", "Record updated successfully.");
						nextPage = "createUpdateCustomer.jsp";
					}else {
						request.setAttribute("error", "Error Occured while updated record.");
						nextPage = "createUpdateCustomer.jsp";
					}
				} catch (Exception e) {
				}
			
		} else if(docmd.equalsIgnoreCase("sendCustomerIdToCustomerDelete")) {
			int CustId = request.getParameter("custId") != null ? Integer.parseInt(request.getParameter("custId")):0;
			try {
				String result = CustomerDaoImpl.getInstance().deleteCustomer(CustId);
				if(result.equals("success")) {
					request.setAttribute("success", "Delete Customer successfully.");
					nextPage = "viewAllCustomer.jsp";
				} else {
					request.setAttribute("error", "Error Occured while delete record.");
					nextPage = "viewAllCustomer.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} else if(docmd.equalsIgnoreCase("approveCustomerRequest")) {
			int custId = request.getParameter("custId") != null ? Integer.parseInt(request.getParameter("custId")):0;
			try {
				String result = CustomerDaoImpl.getInstance().approveCustomer(custId);
				if(result.equals("success")) {
					String pwd = PasswordGenerator.getSixDgtPwd();
					//Creating Account Number
					String accountNo = "7884"+PasswordGenerator.getSixDgtPwd();
					CustomerEntity cEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
					cEntity.setPassword(pwd);
					cEntity.setCustomV1(accountNo);
					CustomerDaoImpl.getInstance().updateCustomer(cEntity);
					
					
					
					//Sending mail to customer with credentials.
					
					
					
					String to = cEntity.getEmail();
					String subject = "Your Login Credentials for OnlineBanking";
					StringBuilder sb = new StringBuilder();
					sb.append("Your UserName is : "+cEntity.getUserName());
					sb.append("Password : "+pwd);
					sb.append("Account No : "+accountNo);
					
					sb.append("Thank you for using Fragile Online Banking System.!!!");
					SendEmail.sendMail(to, subject, sb.toString());
					
					
					request.setAttribute("success", "Customer Approved successfully.");
					nextPage = "viewAllCustomer.jsp";
				} else {
					request.setAttribute("error", "Error Occured while approving customer.");
					nextPage = "viewAllCustomer.jsp";
				}
			} catch (Exception e) {
			}
		}
		
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

}
