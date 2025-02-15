<%@page import="java.util.Iterator"%>
<%@page import="com.bankingsystem.daoimpl.AccountDaoImpl"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@page import="com.bankingsystem.entity.AccountEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");
	
	AccountEntity aEntity = (AccountEntity)request.getAttribute("aEntity");
	
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	
	String docmd = request.getParameter("docmd");
	
	
	Collection<AccountEntity> transactionList = null;
	
	/*
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		if(sDate =="" || eDate == "" && sDate != null || eDate != null ){
			
		transactionList = AccountDaoImpl.getInstance().getAccountStatement(sDate, eDate, custId);
		}
		
		*/
		
		
		double miAmount = Double.parseDouble(request.getParameter("miAmount"));
		double mxAmount = Double.parseDouble(request.getParameter("mxAmount"));
		
		if(miAmount > 0 || mxAmount > 0){
		transactionList = AccountDaoImpl.getInstance().getAccountStatementAmount(miAmount, mxAmount, custId);
		}
			
	
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Statement</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https:maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<script type="text/javascript">
	function search() {
		var isValid = true;
		var sDate = document.getElementById("sDate").value;
		var eDate = document.getElementById("eDate").value;
		var miAmount = document.getElementById("miAmount").value;
		var mxAmount = document.getElementById("mxAmount").value;
		/*
		if(sDate == "" || eDate == "" ){
			alert("Please enter valid data to proceed.");
			document.getElementById("sDate").style.backgroundColor = "#f0ebc7";
			document.getElementById("eDate").style.backgroundColor = "#f0ebc7";
			isValid = false;
		}
		*/
		if(miAmount == "" || mxAmount == "" ) {
			alert("Please enter valid data to proceed.");
			document.getElementById("miAmount").style.backgroundColor = "#f0ebc7";
			document.getElementById("mxAmount").style.backgroundColor = "#f0ebc7";
			isValid = false;
		}
		
		if(isValid){
			document.getElementById("viewStatement").submit();
		}
		

		
	}
	
	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>

<div class="well"><h4 style="color: #f14a46;">View All Statement</h4></div>
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
<form action="ForwardActionController" method="post" id="viewStatement" name="viewStatement">
	<input type="hidden" name="docmd" id="docmd" value="accountStatement">
	<input type="hidden" name="custId" id="custId" value="<%=custId %>">
	<input type="hidden" name="nextPage" id="nextPage" value="viewStatement.jsp">
	<div class="row" style="padding: 8px;">
	    <div class="col-md-1">
	    	<label for="sDate">Start Date</label>
	    </div>
	    <div class="col-md-2">
	     	<input type="date" class="form-control" id="sDate" name="sDate" value="">
	    </div>
    
	    <div class="col-md-1">
	    	<label for="eDate">End date</label>
	    </div>
	    <div class="col-md-2">
	    	<input type="date" class="form-control" id="eDate" name="eDate" value="">
	    </div>
	    <div><h1 style="margin-left:49%;">Or</h1></div>
	    <div class="col-md-1">
	    	<label for="miAmount">Minimum Amount</label>
	    </div>
	    <div class="col-md-2">
	     	<input type="number" class="form-control" id="miAmount" name="miAmount" value="">
	    </div>
    
	    <div class="col-md-1">
	    	<label for="mxAmount">Maximum Amount</label>
	    </div>
	    <div class="col-md-2">
	    	<input type="number" class="form-control" id="mxAmount" name="mxAmount" value="">
	    </div>
    </div>
   <span id="cDate"><%=aEntity != null ? aEntity.getDate() : ""%></span>
<button type="button" class="btn" style="background-color:#f14a46;color:white;margin-left: 10px;
margin-bottom: 10px;" onclick="search();">Search</button>

<table class="table table-bordered">
    <thead>
      <tr>
        <th>Date</th>
        <th>Amount</th>
        <th>Remark</th>
      </tr>
    </thead>
    <tbody>
     <% 
     	if(transactionList != null && !transactionList.isEmpty() ){
    		Iterator<AccountEntity> itr = transactionList.iterator();
    		while(itr.hasNext()){
    			AccountEntity acntEntity = itr.next();
    			
    %>
    	<tr>
	        <td><%=acntEntity.getDate() %></td>
	        <td><%=acntEntity.getBalance() %> <%=acntEntity.getCustomV1() %></td>
	        <td><%=acntEntity.getRemark() != null ? acntEntity.getRemark() : " "  %></td>
      	</tr>
    <%
    		}
     	} else if(transactionList != null && !transactionList.isEmpty() == false){
     %>
     <tr>
     	<td></td>
     	<td><h2>No Transaction Found</h2></td>
     	<td></td>
     </tr>
     <% } %>
    </tbody>
</table>

</form>
</body>
</html>