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
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Account</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://kit.fontawesome.com/8507d47ac8.js" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
	function addPayee() {
		window.open('addPayee.jsp', '_blank', "toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=0,left=400,width=520,height=500");
	}
	function viewAllPayee() {
		window.open('ViewAllPayee.jsp');
	}
	function sendMoney() {
		window.open('sendMoney.jsp', '_blank', "toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=0,left=400,width=520,height=500");
	}
	function deposit() {
		window.open('deposit.jsp', '_blank', "toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=0,left=400,width=520,height=500");
	}
	
	function withdraw() {
		window.open('withdraw.jsp', '_blank', "toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=0,left=400,width=520,height=500");
	}
	
	function viewStatement() {
		window.open('viewStatement.jsp', '_blank', "toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=0,left=400,width=520,height=500");
	}
	

setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
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
</div>
<div class="well"><h4 style="color: #f14a46;">Manage Account</h4></div>
<form action="" id="" name="">
	<input type="hidden" name="docmd" id="docmd" value="manageAccount">
	<input type="hidden" name="custId" id="custId" value="<%=custEntity != null ? custEntity.getCustId() : "0"%>">
	<div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="Branch">Branch :</label>
	    </div>
	    <div class="col-md-3">
	    	<%=custEntity != null ? custEntity.getBranch() : "" %>
	    </div>
	    
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="IFSC">IFSC Code :</label>
	    </div>
	    <div class="col-md-3">
	    	<%=custEntity != null ? custEntity.getIfsc() : "" %>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    <label for="account">Account No :</label>
	    </div>
	    <div class="col-md-10">
	    	<%=custEntity != null ? custEntity.getCustomV1() : "" %>
	    </div>
	    
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    <label for="Name">Name :</label>
	    </div>
	    <div class="col-md-5">
	     	<%=custEntity.getName() %>
	    </div>
	    
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    <label for="Email">Email :</label>
	    </div>
	    <div class="col-md-5">
	    	<%=custEntity.getEmail() %>
	    </div>
	    
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    <label for="Contact">Contact :</label>
	    </div>
	    <div class="col-md-5">
	    	<%=custEntity.getContact() %>
	    </div>
	   
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    <label for="Abalance">Available Balance :</label>
	    </div>
	    <div class="col-md-5">
	    	<%=custEntity.getAvl_balance() %>
	    </div>
	    
    </div>
    <div class="row " style="padding: 8px 20px;">
    	<button type="button" class="btn" style="background-color:#f14a46;color:white;" onclick="addPayee();"><span class="glyphicon glyphicon-share-alt"></span> Add Payee</button>
    	<button type="button" class="btn" style="background-color:#f14a46;color:white;" onclick="viewAllPayee();"><span class="glyphicon glyphicon-user"></span> View All Payee</button>
    	<button type="button" class="btn" style="background-color:#f14a46;color:white;" onclick="sendMoney()"><span class="glyphicon glyphicon-usd"></span> Send Money</button>
	    <button type="button" class="btn" style="background-color:#f14a46;color:white;" onclick="deposit();"><span class="glyphicon glyphicon-piggy-bank"></span> Deposit</button>
	    <button type="button" class="btn" style="background-color:#f14a46;color:white;" onclick="withdraw();"><i class="fa-solid fa-money-bill-1-wave"></i> Withdraw</button>
	    <button type="button" class="btn" style="background-color:#f14a46;color:white;" onclick="viewStatement();"><span class="glyphicon glyphicon-list-alt"></span> View Statement</button>
	</div>
</form>
</body>
</html>