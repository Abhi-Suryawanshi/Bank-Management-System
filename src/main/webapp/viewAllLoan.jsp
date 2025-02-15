<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bankingsystem.daoimpl.LoanDaoimpl"%>
<%@page import="com.bankingsystem.entity.LoanEntity"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	Collection<LoanEntity> loanList = LoanDaoimpl.getInstance().getAllLoans();
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity cuEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	Collection<CustomerEntity> custList = CustomerDaoImpl.getInstance().getAllCostomer();
	LoanEntity lEntites =  (LoanEntity)request.getAttribute("lEntity");
	String loanType = lEntites != null ? lEntites.getLoanType() : request.getParameter("loanType");
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Loan</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

function sendLoanIdToLoanUpdate(loanId) {
	document.getElementById("loanId").value=loanId;
	document.getElementById("docmd").value="sendLoanIdToLoanUpdate";
	if (confirm("Do you want to Update Loan.!!")) {
		document.getElementById("sendIdToLoanControllerForm").submit();
	}
}

function sendLoanIdToLoanDelete(loanId) {
	document.getElementById("loanId").value=loanId;
	document.getElementById("docmd").value="sendLoanIdToLoanDelete";
	if (confirm("Do you want to delete Loan.!!")) {
		document.getElementById("sendIdToLoanControllerForm").submit();
	}
}

function sendLoanIdToLoanDisbursed(loanId) {
	document.getElementById("loanId").value=loanId;
	document.getElementById("docmd").value="sendLoanIdToLoanDisbursed";
	if (confirm("Do you want to Disbursed Loan.!!")) {
		document.getElementById("sendIdToLoanControllerForm").submit();
	}
}

function notApproval() {
	alert("Approval for loan you have minimum 50000 on your Account Balance.");
}

</script>
<body>
		<%	
		if (custId > 0) {
		%>
<form action="LoanController" name="sendIdToLoanControllerForm" id="sendIdToLoanControllerForm" method="post">
	<input type="hidden" name="docmd" id="docmd" value=""> 
	<input type="hidden" name="loanId" id="loanId" value="">
	<input type="hidden" name="custId" id="custId" value="<%=cuEntity != null ? cuEntity.getCustId() : "0"%>">
	<input type="hidden" name="nextPage" id="nextPage" value="">
</form>

<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;">VIEW ALL LOAN</h4></div>

	<table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th>Contact</th>
        <th>Loan Type</th>
        <th>Loan Amount</th>
        <th>Available Balance</th>
        <th>Loan Purpose</th>
        <th></th>
       
      </tr>
    </thead>
    <tbody>
      <%
      if(loanList != null){
    	  Iterator<LoanEntity> itr = loanList.iterator();
    	  
    	  while(itr.hasNext()){
    		LoanEntity lEntity = itr.next();
    		CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(lEntity.getCustId());

      %>
      
      <tr>
        <td><%=custEntity.getName()%></td>
        <td><%=custEntity.getContact()%></td>
        <td><%=lEntity.getLoanType().replace("_", " ")%></td>
        <td><%=lEntity.getLamt()%></td>
        <td><%=custEntity.getAvl_balance() %></td>
        <td><%=lEntity.getPoloan()%></td>
        <td class="text-center">
        	<button type="button" class="btn btn-success"
        	onclick="sendLoanIdToLoanUpdate('<%=lEntity.getLoanId()%>')">Update</button>
       		<button type="button" class="btn btn-danger" 
        	onclick="sendLoanIdToLoanDelete('<%=lEntity.getLoanId()%>')">Delete</button>
        <%if(custEntity.getAvl_balance() > 500) {%>
        	<button type="button" class="btn btn-info" 
        	onclick="sendLoanIdToLoanDisbursed('<%=lEntity.getLoanId()%>')">Disbursed</button>
        <%}else{ %>
        <button type="button" class="btn btn-info" 
        	onclick="notApproval()">Disbursed</button>
        	
        <%} %>
      
        </td>
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