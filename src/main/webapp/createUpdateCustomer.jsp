<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bankingsystem.daoimpl.MSDefinitionDAOImpl"%>
<%@page import="com.bankingsystem.entity.MSDefinitionEntity"%>
<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	int uCustId = request.getParameter("custId") != null ? Integer.parseInt(request.getParameter("custId")) : 0;
	int custId = uCustId== 0 && session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : uCustId;
	


	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	Collection <MSDefinitionEntity> accountTypeList= MSDefinitionDAOImpl.getInstance().findByCategory("ACCOUNT_TYPE");
	Collection<MSDefinitionEntity> branchTypeList = MSDefinitionDAOImpl.getInstance().findByCategory("BANK_BRANCH");
	
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Update Customer</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function saveFieldData(){
		var isValid = true;
		//Read textbox value
		var fullName = document.getElementById("fname").value;
		var contact = document.getElementById("contact").value;
		var email = document.getElementById("email").value;
		var aadhar = document.getElementById("aadhar").value;
		var pan = document.getElementById("pan").value;
		var userName = document.getElementById("username").value;
		var address = document.getElementById("address").value;
		var dob = document.getElementById("dob").value;
		var accountType = document.getElementById("accountType").value;
		var ifsc = document.getElementById("ifsc").value;
		var branch = document.getElementById("branch").value;
		var occupation = document.getElementById("occupation").value;
		var gender = document.getElementById("gender").value;
		var nominee = document.getElementById("nominee").value;
		
		var birth = new Date(dob);
		var birthYear = birth.getYear();
		var now = new Date();
		var currentYear = now.getYear();
		var age = currentYear - birthYear;
		
		if(age < 18){
		alert("Please enter valid Date of Birth to Proceed");
		}
		
		if(contact.length!=10){
			alert("Please enter valid contact");
			isValid = false;
		}
		
		if(aadhar.length!=12){
			alert("Please enter valid aadhar");
			isValid = false;
		}
		if(fullName == "" || contact == "" || email == "" || aadhar == "" || pan == "" || userName == "" || address == "" || dob == "" || accountType == "" || ifsc == "" || branch == "" || occupation == "" || gender == "" || nominee == "" || age < 18){
			alert("Please enter valid data to proceed.");
			isValid = false;
			document.getElementById("fname").style.backgroundColor = "#f0ebc7";
			document.getElementById("contact").style.backgroundColor = "#f0ebc7";
			document.getElementById("email").style.backgroundColor = "#f0ebc7";
			document.getElementById("aadhar").style.backgroundColor = "#f0ebc7";
			document.getElementById("pan").style.backgroundColor = "#f0ebc7";
			document.getElementById("username").style.backgroundColor = "#f0ebc7";
			document.getElementById("address").style.backgroundColor = "#f0ebc7";
			document.getElementById("dob").style.backgroundColor = "#f0ebc7";
			document.getElementById("accountType").style.backgroundColor = "#f0ebc7";
			document.getElementById("ifsc").style.backgroundColor = "#f0ebc7";
			document.getElementById("branch").style.backgroundColor = "#f0ebc7";
			document.getElementById("occupation").style.backgroundColor = "#f0ebc7";
			document.getElementById("gender").style.backgroundColor = "#f0ebc7";
			document.getElementById("nominee").style.backgroundColor = "#f0ebc7";

		}
		if(isValid){
			document.getElementById("createUpdateCustomerForm").submit();
		}
		
	}
	
	function getPinCode(branch){
		
		var ifsc = branch.split("~")[1];
		document.getElementById("ifsc").value=ifsc;
		
		
	}
	
</script>
<body>
<div class="well" style="font-weight: bold"><h4 style="color: #f14a46;">Create Update Customer</h4></div>
<%if(successMsg != null){%>
	<div class="alert alert-success" style="width: 50%;margin-left: 25%;">
	  <strong>Success!</strong> <%=successMsg %>
	</div>
<%
} 
%>

<%if(errorMsg != null){ %>
	<div class="alert alert-danger" style="width: 50%;margin-left: 25%;">
	  <strong>Error</strong> <%=errorMsg %>
	</div>
<%
}
%>
 <form action="CustomerController" method="post" id="createUpdateCustomerForm" name="createUpdateCustomerForm">
    <input type="hidden" name="docmd" id="docmd" value="updateCustomer">
    <input type="hidden" name="custId" id="custId" value="<%=custEntity != null ? custEntity.getCustId():"0"%>">
    <div class="row" style="padding: 8px">
    <div class="col-md-2">
    	<label for="full-name">Full Name</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder="Full Name" id="fname" name="fname" value="<%=custEntity.getName()%>">
    </div>
    <div class="col-md-2">
    	<label for="contact">Contact</label>
    </div>
    <div class="col-md-4">
    	<input type="number" class="form-control" maxlength="10" placeholder="Contact" id="contact" name="contact" value="<%=custEntity.getContact()%>">
    </div>
    </div>
    
    
    <div class="row" style="padding: 8px">
    <div class="col-md-2">
    	<label for="email">Email</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder="Email" id="email" name="email" value="<%=custEntity.getEmail()%>">
    </div>
    <div class="col-md-2">
    	<label for="aadhar">Aadhar Number</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" maxlength="12" placeholder="Aadhar Number" id="aadhar" name="aadhar" value="<%=custEntity.getAadhar() != null ? custEntity.getAadhar() : ""%>">
    </div>
    </div>
    
    <div class="row" style="padding: 8px">
    <div class="col-md-2">
    	<label for="pan">Pan Number</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder="Pan Number" id="pan" name="pan" style="text-transform: uppercase;" value="<%=custEntity.getPan() != null ? custEntity.getPan() : ""%>">
    </div>
    <div class="col-md-2">
    	<label for="username">User Name</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder="User Name" id="username" name="username" value="<%=custEntity.getUserName()%>">
    </div>
    </div>
    
    <div class="row" style="padding: 8px">
    <div class="col-md-2">
    	<label for="address">Address</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder=Address id="address" name="address" value="<%=custEntity.getAddress()%>">
    </div>
    <div class="col-md-2">
    	<label for="dob">DOB</label>
    </div>
    <div class="col-md-4">
    	<input type="date" class="form-control" placeholder="DOB" id="dob" name="dob" value="<%=custEntity.getDob()%>">
    </div>
    </div>
    
    <div class="row" style="padding: 6px">
    <div class="col-md-2">
    	<label for="account">Account Type</label>
    </div>
    <div class="col-md-4 ">
    	<select class="form-control" id="accountType" name="accountType" >
	     	<option value=""><%=custEntity.getAccountType() != null ? custEntity.getAccountType() : "--Select--"%></option>
	     	<%
	     		if(accountTypeList != null && !accountTypeList.isEmpty()){
	     			Iterator<MSDefinitionEntity> itr = accountTypeList.iterator();
	     			while(itr.hasNext()){
	     				MSDefinitionEntity defEntity = (MSDefinitionEntity)itr.next();
	     	%>
	     		<option value="<%=defEntity.getName()%>"><%=defEntity.getName()%></option>
	     	<%
	     			}
	     		}
	     	%>
   		</select>
    </div>
    <div class="col-md-2">
    	<label for="occupation">Occupation</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder="Occupation" id="occupation" name="occupation" value="<%=custEntity.getOccupation() != null ? custEntity.getOccupation() : ""%>">
    </div>
    </div>
    
    <div class="row" style="padding: 8px">
    <div class="col-md-2">
    	<label for="brance">Branch</label>
    </div>
    <div class="col-md-4 ">
    	<select class="form-control" id="branch" name="branch" onchange="getPinCode(this.value)">
	     <option><%=custEntity.getBranch() != null ? custEntity.getBranch() : "--Select--" %></option>
	     <%
	     if(branchTypeList != null && !branchTypeList.isEmpty()){
	    	 Iterator<MSDefinitionEntity> itr = branchTypeList.iterator();
	    	 while(itr.hasNext()){
	    		 MSDefinitionEntity defEntity = (MSDefinitionEntity)itr.next();
	    		 
	    %>
	    	<option value="<%=defEntity.getName()+"~"+defEntity.getDescription()%>"><%=defEntity.getName() %></option>
	    <%
	    	 }
	     }
	     %>
   		</select>	
    </div>
    <div class="col-md-2">
    	<label for="ifsc">IFSC Code</label>
    </div>
    <div class="col-md-4">
    	<input type="text" class="form-control" placeholder="IFSC Code" id="ifsc" name="ifsc" style="text-transform: uppercase;" value="<%=custEntity.getIfsc() != null ? custEntity.getIfsc() : ""%>">
    </div>
    
    </div>
    
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="gender">Gender</label>
	    </div>
	    <div class="col-md-4 ">
	    <div class="form-check" >
	      <input type="radio" class="form-check-input" id="gender" name="gender" value="Male">
	      <label class="form-check-label" for="radio1">Male</label>
	      <input type="radio" class="form-check-input" id="gender" name="gender" value="Female">
	      <label class="form-check-label" for="radio2">Female</label>
	      <input type="radio" class="form-check-input" id="gender" name="gender" value="Other">
	      <label class="form-check-label" for="radio2">Other</label>
   		</div>
    	</div>
	    <div class="col-md-2">
	    	<label for="nominee">Nominee</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Nominee" id="nominee" name="nominee" value="<%=custEntity.getNominee() != null ? custEntity.getNominee() : ""%>">
	    </div>
    </div>
    <div class="col-md-offset-2">
    	<button type="button" style="background-color:#f14a46;color: white;" class="btn"  onclick="saveFieldData()">Save</button>
    </div>
    
</form>						
 
</body>
</html>