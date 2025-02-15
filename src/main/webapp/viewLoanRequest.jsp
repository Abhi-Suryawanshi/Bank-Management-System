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
	Collection<LoanEntity> loanList = LoanDaoimpl.getInstance().getAllLoanRequest();
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Loan Request</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

function sendLoanIdToLoanUpdate(loanId) {
	document.getElementById("loanId").value = loanId;
	document.getElementById("nextPage").value="applyForLoan.jsp";
	var frm = document.getElementById('sendIdToLoanControllerForm').action ="ForwardActionController"
	if (confirm("Do you want to Update Loan.!!")) {
		document.getElementById("sendIdToLoanControllerForm").submit();
	}
}

function sendLoanIdToLoanDelete(loanId) {
	document.getElementById("loanId").value=loanId;
	document.getElementById("docmd").value="sendLoanIdToLoanDelete";
	var frm = document.getElementById('sendIdToLoanControllerForm').action ="LoanController"
	if (confirm("Do you want to delete Loan.!!")) {
		document.getElementById("sendIdToLoanControllerForm").submit();
	}
}

function approveLoan(loanId) {
	document.getElementById("loanId").value=loanId;
	document.getElementById("docmd").value="approveLoanRequest";
	var frm = document.getElementById('sendIdToLoanControllerForm').action ="LoanController"
	if (confirm("Do you want to Approve Loan.!!")) {
		document.getElementById("sendIdToLoanControllerForm").submit();
	}
}

</script>
<body>
<form action="" name="sendIdToLoanControllerForm" id="sendIdToLoanControllerForm" method="post">
	<input type="hidden" name="docmd" id="docmd" value=""> 
	<input type="hidden" name="loanId" id="loanId" value="">
	<input type="hidden" name="nextPage" id="nextPage" value="">
</form>

<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;">VIEW LOAN REQUEST	</h4></div>

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
        <button type="button" class="btn btn-warning" 
        	onclick="approveLoan('<%=lEntity.getLoanId()%>')">Approve</button>
        	
        </td>
      </tr>
      
      <%
    	  }
      }
    
      %>
      
     
    </tbody>
  </table>


</body>
</html>