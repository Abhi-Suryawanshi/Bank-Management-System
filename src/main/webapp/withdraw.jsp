<%@page import="com.bankingsystem.entity.AccountEntity"%>
<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");
	
	AccountEntity aEntity = (AccountEntity)request.getAttribute("aEntity");

	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);

%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw Amount</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/8507d47ac8.js" crossorigin="anonymous"></script>
  
</head>
<script type="text/javascript">

	function withdrawAmt() {
	var isValid = true;
	var wAmount = document.getElementById("wAmount").value;
	var remark = document.getElementById("remark").value;
	var avlBal = document.getElementById("avlBal").value=<%=custEntity.getAvl_balance() %>;
	if(avlBal < wAmount){
		alert("Insufficient Balance In your Account To Proceed!!!");
		isValid = false;
	} 
		 
	
	if(wAmount == "" || wAmount == 0){
		alert("Please enter valid data to proceed.");
		isValid = false;
		document.getElementById("wAmount").style.backgroundColor = "#f0ebc7";
		document.getElementById("withBtn").this.disabled=false;
	}
	if(isValid){
		document.getElementById("withdrawMoney").submit();
	}
	
	}
	  window.onunload = refreshParent;
	    function refreshParent() {
	        window.opener.location.reload();
	    }
	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
<div class="well"><h4 style="color: #f14a46;">Withdraw Money</h4></div>

<div>
	<%if(successMsg != null){%>
		<div class="alert alert-success" style="width: 80%;text-align: center;margin-left: 10%;">
		  <strong>Success!</strong> <%=successMsg %>
		</div>
	<%
	} 
	%>
	
	<%if(errorMsg != null){ %>
		<div class="alert alert-danger" style="width: 80%;text-align: center;margin-left: 10%;">
		  <strong>Error</strong> <%=errorMsg %>
		</div>
	<%
	}
	%>
</div>

<form action="AccountController" method="post" id="withdrawMoney" name="withdrawMoney">
	<input type="hidden" name="docmd" id="docmd" value="withdrawAmount">
	<input type="hidden" name="acId" id="acId" value="<%=aEntity != null ? aEntity.getAcId() : "0"%>">
	<input type="hidden" name="custId" id="custId" value="<%=custEntity != null ? custEntity.getCustId() : "0"%>">
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
	    	<label for="account">Account No :</label>
	    </div>
	    <div class="col-md-10">
	    	<%=custEntity != null ? custEntity.getCustomV1() : "" %>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="Abalance">Available Balance :</label>
	    </div>
	    <div class="col-md-5">
	    	<span id="avlBal"><%=custEntity.getAvl_balance() %></span>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="wAmount">Withdraw Amount<span style="color: red;">*</span> :</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="number" class="form-control" name="wAmount" id="wAmount" placeholder="Withdraw Amount" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="remark">Remark :</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="text" class="form-control" name="remark" id="remark" placeholder="Remark" value="">
	    </div>
    </div>
    <button type="button" class="btn" id="withBtn" style="background-color:#f14a46;color:white;margin-left: 10px;" onclick="withdrawAmt();this.disabled=true;"><i class="fa-solid fa-money-bill-1-wave"></i> Withdraw Money</button>
</form>
</body>
</html>