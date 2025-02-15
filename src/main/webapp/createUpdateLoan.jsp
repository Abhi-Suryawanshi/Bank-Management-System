<%@page import="com.bankingsystem.daoimpl.LoanDaoimpl"%>
<%@page import="com.bankingsystem.entity.LoanEntity"%>
<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");

	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	LoanEntity lEntity = LoanDaoimpl.getInstance().findByCustId(custId);
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	String loanType = lEntity != null ? lEntity.getLoanType() : request.getParameter("loanType");
%>
	
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Update Loan</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function saveLoanData() {
		var isValid = true;
		var Spouse = document.getElementById("Spouse").value;
		var Designation = document.getElementById("Designation").value;
		var Dependents = document.getElementById("nod").value;
		var Education = document.getElementById("Education").value;
		var Liability = document.getElementById("pl").value;
		var LOService = document.getElementById("los").value;
		var Income = document.getElementById("ai").value;
		var house = document.getElementById("house").value;
		var lamt = document.getElementById("lamt").value;
		var Vehicle = document.getElementById("Vehicle").value;
		var poloan = document.getElementById("pol").value;
		var passport = document.getElementById("psp").value;
		if(Spouse == "" || Designation == "" || Dependents == "" || Education == "" || 
			Liability == "" || LOService == "" || Income == "" || house == "" ||
			lamt == "" || poloan == "" || passport == "" ){
			alert("Please enter valid data to proceed.");
			isValid = false;
			document.getElementById("Spouse").style.backgroundColor = "#f0ebc7";
			document.getElementById("Designation").style.backgroundColor = "#f0ebc7";
			document.getElementById("nod").style.backgroundColor = "#f0ebc7";
			document.getElementById("Education").style.backgroundColor = "#f0ebc7";
			document.getElementById("pl").style.backgroundColor = "#f0ebc7";
			document.getElementById("los").style.backgroundColor = "#f0ebc7";
			document.getElementById("ai").style.backgroundColor = "#f0ebc7";
			document.getElementById("house").style.backgroundColor = "#f0ebc7";
			document.getElementById("lamt").style.backgroundColor = "#f0ebc7";
			document.getElementById("pol").style.backgroundColor = "#f0ebc7";
			document.getElementById("psp").style.backgroundColor = "#f0ebc7";
		}
		if(isValid){
			document.getElementById("createUpdateLoanForm").submit();
		}
		
	}

	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
<div class="well"><h4 style="color: #f14a46;">APPLY FOR <%=lEntity != null  ? lEntity.getLoanType() : loanType%></h4></div>
<div>
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
</div><%=lEntity != null ? lEntity.getLoanId():"0"%>
<form action="LoanController" method="post" id="createUpdateLoanForm" name="createUpdateLoanForm">
	<input type="hidden" name="loanType" id="loanType" value="<%=loanType %>">
	<input type="hidden" name="docmd" id="docmd" value="createLoan">
	<input type="hidden" name="loanId" id="loanId" value="<%=lEntity != null ? lEntity.getLoanId():"0"%>">
	<input type="hidden" name="custId" id="custId" value="<%=custEntity != null ? custEntity.getCustId():"0"%>">
	<div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="full-name">Full Name</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Full Name" id="fname" name="fname" value="<%=custEntity.getName() %>" disabled>
	    </div>
	    <div class="col-md-2">
	    	<label for="Spouse">Spouse<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Fathers / Spouse" id="Spouse" name="Spouse" value="<%=lEntity != null ? lEntity.getSpouse():""%>">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="Designation">Designation<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Designation" id="Designation" name="Designation" value="<%=lEntity != null ? lEntity.getDesignation():""%>">
	    </div>
	    <div class="col-md-2">
	    	<label for="dob">Date Of Birth</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="date" class="form-control" maxlength="10" placeholder="Date Of Birth" id="dob" name="dob" value="<%=custEntity.getDob()%>" disabled>
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="Gender">Gender</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Gender" id="Gender" name="Gender" value="<%=custEntity.getGender()%>" disabled>
	    </div>
	    <div class="col-md-2">
	    	<label for="nod">Name Of Dependents<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" maxlength="10" placeholder="Name Of Dependents" id="nod" name="nod" value="<%=lEntity != null ? lEntity.getDependents():""%>">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="Education">Education<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Education" id="Education" name="Education" value="<%=lEntity != null ? lEntity.getEducation():""%>">
	    </div>
	    <div class="col-md-2">
	    	<label for="od">Occupation</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Occupation" id="Occupation" name="Occupation" value="<%=custEntity.getOccupation()%>" disabled>
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="pl">Present Liability<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Present Liability" id="pl" name="pl" value="<%=lEntity != null ? lEntity.getLiability():""%>">
	    </div>
	    <div class="col-md-2">
	    	<label for="los">Length of Service<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="number" class="form-control" maxlength="10" placeholder="Length of Service : Years / Months" id="los" name="los" value="<%=lEntity != null ? lEntity.getLOService():""%>">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="ai">Annual Income<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="number" class="form-control" placeholder="Annual Income" id="ai" name="ai" value="<%=lEntity != null ? lEntity.getIncome():""%>">
	    </div>
	    <div class="col-md-2">
	    	<label for="house">Do you own a House<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<select class="form-control" id="house" name="house">
	    	<option><%=lEntity != null ? lEntity.getHouse() : "-- Select --" %></option>
	    	<option>Yes</option>
	    	<option>No</option>
	    	</select>
	    	
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="lamt">Loan Amount<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="number" class="form-control" maxlength="10" placeholder="Loan Amount:" id="lamt" name="lamt" value="<%=lEntity != null ? lEntity.getLamt():""%>">
	    </div>
	    <div class="col-md-2">
	    	<label for="Vehicle">Vehicle</label>
	    </div>
	    <div class="col-md-4">
	    	<select class="form-control" id="Vehicle" name="Vehicle">
	    	<option><%=lEntity != null ? lEntity.getVehicle() : "-- Select --" %></option>
	    	<option>Yes</option>
	    	<option>No</option>
	    	</select>
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="pol">Purpose of Loan<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Purpose of Loan" id="pol" name="pol" value="<%=lEntity != null ? lEntity.getPoloan():""%>">
	    </div>
	    <div class="col-md-2">
	    	<label for="psp">Passport Size Photo<span style="color: red;">*</span></label>
	    </div>
	    <div class="col-md-4">
	    	<input type="file" class="form-control" placeholder="Passport Size Photo" id="psp" name="psp" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
    	<div class="col-md-2">
	    	<label for="Address">Address</label>
	    </div>
	    <div class="col-md-10">
	    	<textarea id="Address" class="form-control" name="Address" placeholder="Address" rows="4" cols="54" disabled><%=custEntity.getAddress()%></textarea>
	    </div>
    </div>
    <div class="row" style="padding: 8px">
		<div class="col-md-offset-3">    
    		<button type="button" style="background-color:#f14a46;color: white;" class="btn"  onclick="saveLoanData()">Save</button>
    	</div>
    </div>
</form>
</body>
</html>