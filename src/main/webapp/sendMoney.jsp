<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bankingsystem.daoimpl.AddPayeeDaoImpl"%>
<%@page import="com.bankingsystem.entity.AddPayeeEntity"%>
<%@page import="com.bankingsystem.entity.AccountEntity"%>
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
	
	Collection<AddPayeeEntity> payeeList = AddPayeeDaoImpl.getInstance().getAllPayee();
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send Money</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
</head>
<script type="text/javascript">

	function sendMoneyFun(){
		var isValid = true;
		var custId = document.getElementById("custId").value;
		var paNa = document.getElementById("paNa").value;
		var paAcc = document.getElementById("paAcc").value;
		var sendAmount = document.getElementById("sendAmount").value;
		var remark = document.getElementById("remark").value;
	
	if( paNa == "" || paAcc == 0 || paAcc == "" || sendAmount == "" || sendAmount == 0 ){
		alert("Please enter valid data to proceed.");
		isValid = false;
		document.getElementById("paNa").style.backgroundColor = "#f0ebc7";
		document.getElementById("paAcc").style.backgroundColor = "#f0ebc7";
		document.getElementById("sendAmount").style.backgroundColor = "#f0ebc7";
		document.getElementById("sMoney").this.disabled=false;
		
	}
	if(isValid){
		document.getElementById("sendMoney").submit();
	}
	
	}
	
	function getAccountNum(payeeName){
		var paAcc = payeeName.split("~")[1];
		document.getElementById("paAcc").value=paAcc;
    }
	
	  window.onunload = refreshParent;
	    function refreshParent() {
	        window.opener.location.reload();
	    }
	
	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
<div class="well"><h4 style="color: #f14a46;">Send Money</h4></div>

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

<form action="CustomerController" method="post" id="sendMoney" name="sendMoney">
	<input type="hidden" name="docmd" id="docmd" value="sendMoneyAccount">
	<input type="hidden" name="custId" id="custId" value="<%=custEntity != null ? custEntity.getCustId() : "0"%>">
	
	<div class="row" style="padding: 8px;">
	<div class="col-md-2">
    	<label for="paNa">Payee Name<span style="color: red;">*</span></label>
    </div>
    <div class="col-md-4 ">
    	<select class="form-control" id="paNa" name="paNa" onchange="javascript:getAccountNum(this.value);">
	     	<option value=""> --Select--</option>
	     	<%
	     	if(payeeList !=null){
	      	  Iterator<AddPayeeEntity> itr = payeeList.iterator();
	      	  while(itr.hasNext()){
	      		  AddPayeeEntity payeeEntity = itr.next();
	      		  double number = payeeEntity.getSendac();
	    		  long longFormat = (long) number;
	     				
	     	%>
	     		<option value="<%=payeeEntity.getAcName()+"~"+longFormat %>"><%=payeeEntity.getAcName()%></option>
	     	<%
	     			}
	     		}
	     	%>
   		</select>
    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="paAcc">Payee Account<span style="color: red;">*</span> :</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="number" class="form-control" name="paAcc" id="paAcc" placeholder="Payee Account No"  value="" readonly>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="avlBalance">Availabel Balance :</label>
	    </div>
	    <div class="col-md-5">
	    
	    	<input type="number" class="form-control" name="avlBalance" id="avlBalance" placeholder="Availabel Balance" value="<%= custEntity.getAvl_balance() %>" readonly>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="sendAmount">Send Amount<span style="color: red;">*</span> :</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="number" class="form-control"  name="sendAmount" id="sendAmount" placeholder="Send Amount" value="" >
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
    <button type="button" class="btn" id="sMoney" style="background-color:#f14a46;color:white;margin-left: 10px;" onclick="sendMoneyFun();this.disabled=true;">Submit</button>
</form>
</body>
</html>