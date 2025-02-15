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
	
	long acNo = session.getAttribute("acNo") != null ? (long) session.getAttribute("acNo") : 0;
	Collection<CustomerEntity> cEntity = CustomerDaoImpl.getInstance().findCustomerAccount(acNo);
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Payee</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
</head>
<script type="text/javascript">

	function addPay(){
		var isValid = true;
		
		var custId = document.getElementById("custId").value;
		var acNo = document.getElementById("acNo").value;
		var acHoName = document.getElementById("acHoName").value;
		var ifsc = document.getElementById("ifsc").value;
		var nName = document.getElementById("nName").value;
	
	if( acNo == 0 || acHoName == "" || ifsc == "" ){
		alert("Please enter valid data to proceed.");
		isValid = false;
		document.getElementById("acNo").style.backgroundColor = "#f0ebc7";
		document.getElementById("acHoName").style.backgroundColor = "#f0ebc7";
		document.getElementById("ifsc").style.backgroundColor = "#f0ebc7";
		document.getElementById("apay").this.disabled=false;
		
	}
	if(isValid){
		document.getElementById("addPayee").submit();
	}
	
	}
	
	
	function getAccountName(accountNo){
        $.ajax({
            type : 'post',
            url : 'AjaxController',
            dataType : 'json',
            data : {
            	acNo : accountNo,
                docmd : 'getAccountName'
            },
            success : function(jsonResponse) {
                $('#acHoName').val(jsonResponse.split("~")[0]);
                $('#ifsc').val(jsonResponse.split("~")[1]);
            }
        })
    }

	
	  window.onunload = refreshParent;
	    function refreshParent() {
	        window.opener.location.reload();
	    }
	
	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
<div class="well"><h4 style="color: #f14a46;">Add Payee</h4></div>

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

<form action="CustomerController" method="post" id="addPayee" name="addPayee">
	<input type="hidden" name="docmd" id="docmd" value="addPayee">
	<input type="hidden" name="custId" id="custId" value="<%=custEntity != null ? custEntity.getCustId() : "0"%>">
	
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="acNo">Account No<span style="color: red;">*</span> :</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="number" class="form-control" name="acNo" id="acNo" placeholder="Account No" onchange="javascript:getAccountName(this.value);" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="acName">Account Holder Name<span style="color: red;">*</span> :</label>
	    </div>
	    <div class="col-md-5">
	    
	    	<input type="text" class="form-control" name="acHoName" id="acHoName" placeholder="Account Holder Name" value="" readonly>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="ifsc">IFSC<span style="color: red;">*</span> :</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="text" class="form-control"  name="ifsc" id="ifsc" style="text-transform: uppercase;" placeholder="IFSC" value="" readonly>
	    </div>
    </div>
    <div class="row" style="padding: 8px;">
	    <div class="col-md-2">
	    	<label for="nName">Nick Name</label>
	    </div>
	    <div class="col-md-5">
	    	<input type="text" class="form-control" name="nName" id="nName" placeholder="Nick Name" value="">
	    </div>
    </div>
    <button type="button" class="btn" id="apay" style="background-color:#f14a46;color:white;margin-left: 10px;" onclick="addPay();this.disabled=true;">Submit</button>
</form>
</body>
</html>