<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@page import="com.bankingsystem.daoimpl.AddPayeeDaoImpl"%>
<%@page import="com.bankingsystem.entity.AddPayeeEntity"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity CustId = CustomerDaoImpl.getInstance().findByCustId(custId);
	
	int payId = session.getAttribute("payId") != null ? (int) session.getAttribute("payId") : 0;
	AddPayeeEntity PayeeId = AddPayeeDaoImpl.getInstance().findBypayId(payId);
	
	Collection<AddPayeeEntity> payeeList = AddPayeeDaoImpl.getInstance().getAllPayee();
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Payee</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

function sendPayeeIdToPayeeIdDelete(payId) {
	document.getElementById("payId").value=payId;
	document.getElementById("docmd").value="sendPayeeIdToPayeeIdDelete";
	var frm = document.getElementById('sendPayeeIdToCustControllerForm').action ="CustomerController"
	if (confirm("Do you want to delete Payee.!!")) {
		document.getElementById("sendPayeeIdToCustControllerForm").submit();
	}
}

	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
		<%	
		if (custId > 0) {
		%>
<form action="" name="sendPayeeIdToCustControllerForm" id="sendPayeeIdToCustControllerForm" method="post">
	<input type="hidden" name="docmd" id="docmd" value=""> 
	<input type="hidden" name="payId" id="payId" value="">
	<input type="hidden" name="nextPage" id="nextPage" value="">
</form>


<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;">VIEW ALL PAYEE</h4></div>
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
	<table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th>Sender Account Number</th>
        <th>Nick Name</th>
        
       
      </tr>
    </thead>
    <tbody>
      <%
      if(payeeList !=null){
    	  Iterator<AddPayeeEntity> itr = payeeList.iterator();
    	  while(itr.hasNext()){
    		  AddPayeeEntity payeeEntity = itr.next();
    		  double number = payeeEntity.getSendac();
    		  long longFormat = (long) number;
    		  
      %>
      <tr>
        <td><%=payeeEntity.getAcName() %></td>
        <td><%=longFormat %></td>
        <td><%= payeeEntity.getnName() %></td>
        <td class="text-center">
       		<button type="button" class="btn btn-danger" 
        	onclick="sendPayeeIdToPayeeIdDelete('<%=payeeEntity.getPayid()%>')">Delete</button>
        	
      </tr>
      <%
    	  }
      }
      
      %>
      
     
    </tbody>
  </table>
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