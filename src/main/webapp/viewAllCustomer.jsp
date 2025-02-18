<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
Collection<CustomerEntity> custList = CustomerDaoImpl.getInstance().getAllCostomer();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;

CustomerEntity custEntityId = CustomerDaoImpl.getInstance().findByCustId(custId);

%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Customer</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

function sendCustomerIdToCustomerUpdate(custId) {
	document.getElementById("custId").value = custId;
	document.getElementById("nextPage").value="createUpdateCustomer.jsp";
	var frm = document.getElementById('sendIdToCustControllerForm').action ="ForwardActionController"
	if (confirm("Do you want to Update Customer.!!")) {
		document.getElementById("sendIdToCustControllerForm").submit();
	}
}

function sendCustomerIdToCustomerDelete(custId) {
	document.getElementById("custId").value=custId;
	document.getElementById("docmd").value="sendCustomerIdToCustomerDelete";
	var frm = document.getElementById('sendIdToCustControllerForm').action ="CustomerController"
	if (confirm("Do you want to delete Customer.!!")) {
		document.getElementById("sendIdToCustControllerForm").submit();
	}
}

function approveCustomer(custId) {
	document.getElementById("custId").value=custId;	
	document.getElementById("docmd").value="approveCustomerRequest";
	var frm = document.getElementById('sendIdToCustControllerForm').action ="CustomerController"
	if (confirm("Do you want to approve Customer.!!")) {
		document.getElementById("sendIdToCustControllerForm").submit();
	}
}

</script>
<body>
<form action="" name="sendIdToCustControllerForm" id="sendIdToCustControllerForm" method="post">
	<input type="hidden" name="docmd" id="docmd" value=""> 
	<input type="hidden" name="custId" id="custId" value="">
	<input type="hidden" name="nextPage" id="nextPage" value="">
</form>

<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;">VIEW ALL CUSTOMER REQUEST</h4></div>

	<table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th>DOB</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Address</th>
        <th></th>
       
      </tr>
    </thead>
    <tbody>
      <%
      if(custList !=null){
    	  Iterator<CustomerEntity> itr = custList.iterator();
    	  while(itr.hasNext()){
    		  CustomerEntity custEntity = itr.next();
    		  Date date = sdf.parse(custEntity.getDob());
    		  SimpleDateFormat print = new SimpleDateFormat("dd MMM yyyy");    	 
      %>
      <tr>
        <td><%=custEntity.getName() %></td>
        <td><%=print.format(date) %></td>
        <td><%= custEntity.getEmail() %></td>
        <td><%= custEntity.getContact() %></td>
        <td><%= custEntity.getAddress() %></td>
        <td>
        	<%if(custEntity.getCustomN1()>0){ %>
        	<button type="button" class="btn btn-info"
        	onclick="sendCustomerIdToCustomerUpdate('<%=custEntity.getCustId() %>')">Update</button>
       		<button type="button" class="btn btn-danger" 
        	onclick="sendCustomerIdToCustomerDelete('<%=custEntity.getCustId()%>')">Delete</button>
        	<%}else{ %>
        	<button type="button" class="btn btn-warning" 
        	onclick="approveCustomer('<%=custEntity.getCustId()%>')">Approve</button>
        	<%} %>
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