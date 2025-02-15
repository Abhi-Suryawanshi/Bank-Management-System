<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	int custId =   session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	
	boolean isCustomerDtlUpdated = false;
	if(custEntity != null && custEntity.getAadhar() != null && custEntity.getPan() != null 
			&& custEntity.getAccountType() != null && custEntity.getOccupation() != null 
			&& custEntity.getNominee() != null && custEntity.getGender() != null){
		isCustomerDtlUpdated = true;
	}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply For Loan</title>

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="chartjs/bootstrap-card-bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
  
</head>
<script type="text/javascript">

	function emiCalculator() {
		window.location = 'emiCalculator.jsp';
	}

	function personalLoan(loanType,isCustomerDtlUpdated){
		//alert("isCustomerDtlUpdated==>"+isCustomerDtlUpdated);
		if(isCustomerDtlUpdated){
			window.location = 'createUpdateLoan.jsp?loanType='+loanType;
		}else{
			alert("Please update your mandatory details first to proceed.");
		}
	}

</script>
<style>
	.card-body{
		padding: 9rem;
	}
	.col-md-4{
		padding-bottom: 15px;
	}
	.btn{
		font-size: 15px;
	}
</style>
<body>
		<%	
		if (custId > 0) {
		%>
<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;font-size: 1.7rem;">APPLY FOR LAON</h4></div>
	<div class="panel-group">
	<div class="panel">		
		<div class="panel-body" style="padding: 30px">
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/PersonalLoans.jpg');background-repeat: no-repeat;background-size: cover;">							
					</div> 
						<button type="button" onclick="personalLoan('PERSONAL LOAN',<%=isCustomerDtlUpdated %>)" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Personal Loan</button>				
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/carLoan.jpg');background-repeat: no-repeat;background-size: cover;">							
					</div> 
						<button type="button" onclick="personalLoan('CAR LOAN',<%=isCustomerDtlUpdated %>)"  class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Car Loan</button>				
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/homeLoan.png');background-repeat: no-repeat;background-size: cover;">							
					</div>
						<button type="button" onclick="personalLoan('HOME LOAN',<%=isCustomerDtlUpdated %>)" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Home Loan</button>
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/creditCard.jpg');background-repeat: no-repeat;background-size: cover;">							
					</div>
						<button type="button" onclick="personalLoan('CREDIT CARD LOAN',<%=isCustomerDtlUpdated %>)" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Credit Card</button>
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/emi.png');background-repeat: no-repeat;background-size: cover;">							
					</div>
						<button type="button" id="emiC" onclick="emiCalculator()" class="btn btn-lg" style="background-color: #f14a46;color: white;">EMI Calculator</button>
				</div>	
			</div>
		</div>
	</div>
	</div>
		<%
		} else {
		%>
		<div style="margin-top: 10%; margin-left: 20%;">
		<img src="AppData/images/authreq.png" height="300px" width="800px">
		</div>
		<%
		}
		%>
</body>
</html>